Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABFCC4707B
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPVM3rvi8/W7RQ8DCcPKurvGsc9E26VoLW2VwOlV87o=; b=DYo5cZHVu0QQVD
	qZbmlAfd0/DZSEyZWLtco/3G1RDt5bXjzc3m748msMbIqAPvjS2UVLS0/KehF0NPngSiN1sd8lyk3
	Xmvbf1Bz1li4ygGXYpXmsu2Jiaitf4Pv44CU0qDQ6rkIdwllpHK0BLCHeZUX6GL9DwFHVgAAw064k
	3CZTTfDRPQKtxDY13mN4ANC66PfNIXk0ovTRVdkjHranoRrwqXzn2PmxoGzL3qL7d1xof076Jt1yS
	mRJAOgn5T/q5yjIbq6nfjESOzu+b09SWaBZZ15M1RXM3TKtOMrY9Tiu7Tkul2O5gz/++/mSTj/wDc
	QAx7SMyTwvfh6o3n2WPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOe1c-005C4b-0E;
	Sat, 13 Jan 2024 13:26:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOe1U-005C3m-3B
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 13:26:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so7692874e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Jan 2024 05:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705152362; x=1705757162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCoJGAqpwsiqcxa7JziFITYvEFhdX/B6Xk4HAgsjcXg=;
        b=GlWGs97eC5agid7zogGbHZMeJXaIiidhXelym+phH5BvEK6qexlM0CxU57JYZgfajg
         eZHxZPN0i0YcOydJt/+PnlrcvkuZjdSaEZzBgAJJfxcVIxGY6xaUtf8w+/k8lzqIum1p
         hQt9RKdn0oQU68JtpF95ZgWYsQWzHV9rLm9kpi6bYMzr/FFswDeEjw9JUdgEPNtcL/k8
         Jmlx7FHtlf/+giyXdz5bkrq7xm+iTQWl+oKKwto0N/RPK0DtDm0lMZZsWt79gn/v0fpn
         rvB/+8uG8BmpADyJwwwTAXz1DcGKQfBdhqsfnWlqsjqwL9NgE10zTd3AzUIdS4UOXPnr
         QOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705152362; x=1705757162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCoJGAqpwsiqcxa7JziFITYvEFhdX/B6Xk4HAgsjcXg=;
        b=ihg2I1T7h3HAAYm/6lg6lqcyFHzzJ9iFsP1Ejh7DCnq5tjO90ZLpH2ste6zubQ2wR7
         eYmHixuTDHATWtHBz85Rxn9hvyc+wxFYgxMiQJcNNIrb3LOQs6d0ggTUlyhyptiYjxkk
         C97b6Z68m/rqJq6SYuh3dCq+i811fg4+VN2zqUUEAP7LH7opeoS9Up5k/5pNN1ekcSdJ
         Xj7lxvu3TEC0Syw+dt2niK2NAvQLtKptZzLeG6qvwvPi/rW0Uy1x2A1wStshhNNkZiBm
         gN84VIElnmO9UlqYEZsrB/47/0bFgaA053YpA3r65uwpMskBVAsoVWHWOE98daUQmzba
         6iQA==
X-Gm-Message-State: AOJu0YyFz7fk0yDD8xABL3+RDXgwsC0iDJ/n/QPaWbCIMtnkt80o/Ilc
	gVVRBqHxMAqOea2zUq5ghoF0qAhzBhi6HY73Us52zlRjuzRFtbPoHNQv6BcWb4U=
X-Google-Smtp-Source: AGHT+IHE5xPaN8nvq8/skog291P6T5mdgGfq2jJVxfYdpNws3A3mRTmgPyrCUGdpmOhMYsYffIO+g0mBYLAzQRELwCE=
X-Received: by 2002:ac2:5395:0:b0:50e:3ce9:226f with SMTP id
 g21-20020ac25395000000b0050e3ce9226fmr591188lfh.238.1705152362268; Sat, 13
 Jan 2024 05:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20240111131558.31211-1-andy.chiu@sifive.com> <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
 <CA+V-a8v8X0idpo89ZViVJK-7WwKnCojJ7B9449t3v4Y5Rfvh7w@mail.gmail.com>
In-Reply-To: <CA+V-a8v8X0idpo89ZViVJK-7WwKnCojJ7B9449t3v4Y5Rfvh7w@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 13 Jan 2024 21:25:51 +0800
Message-ID: <CABgGipUnT9VBf5ndU+=tYdaw9sbiKw=tJaJMGoJjUeFQB3h2bw@mail.gmail.com>
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com, 
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de, 
	ebiggers@kernel.org, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_052607_468455_A8234875 
X-CRM114-Status: GOOD (  25.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUHJhYmhha2FyLAoKT24gU2F0LCBKYW4gMTMsIDIwMjQgYXQgNDowNeKAr0FNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEph
biAxMiwgMjAyNCBhdCA2OjMy4oCvQU0gPHBhdGNod29yay1ib3QrbGludXgtcmlzY3ZAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGVsbG86Cj4gPgo+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxp
ZWQgdG8gcmlzY3YvbGludXguZ2l0IChmb3ItbmV4dCkKPiA+IGJ5IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPjoKPiA+Cj4gPiBPbiBUaHUsIDExIEphbiAyMDI0IDEzOjE1OjQ4
ICswMDAwIHlvdSB3cm90ZToKPiA+ID4gVGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBydW5u
aW5nIFZlY3RvciBpbiBrZXJuZWwgbW9kZS4KPiA+ID4gQWRkaXRpb25hbGx5LCBrZXJuZWwtbW9k
ZSBWZWN0b3IgY2FuIGJlIGNvbmZpZ3VyZWQgdG8gcnVuIHdpdGhvdXQKPiA+ID4gdHVybm5pbmcg
b2ZmIHByZWVtcHRpb24gb24gYSBDT05GSUdfUFJFRU1QVCBrZXJuZWwuIEFsb25nIHdpdGggdGhl
Cj4gPiA+IHN1cG9ydCwgd2UgYWRkIFZlY3RvciBvcHRpbWl6ZWQgY29weV97dG8sZnJvbX1fdXNl
ci4gQW5kIHByb3ZpZGUgYQo+ID4gPiBzaW1wbGUgdGhyZXNob2xkIHRvIGRlY2lkZSB3aGVuIHRv
IHJ1biB0aGUgdmVjdG9yaXplZCBmdW5jdGlvbnMuCj4gPiA+Cj4gPiA+IFdlIGRlY2lkZWQgdG8g
ZHJvcCB2ZWN0b3JpemVkIG1lbWNweS9tZW1zZXQvbWVtbW92ZSBmb3IgdGhlIG1vbWVudCBkdWUK
PiA+ID4gdG8gdGhlIGNvbmNlcm4gb2YgbWVtb3J5IHNpZGUtZWZmZWN0IGluIGtlcm5lbF92ZWN0
b3JfYmVnaW4oKS4gVGhlCj4gPiA+IGRldGFpbGVkIGRlc2NyaXB0aW9uIGNhbiBiZSBmb3VuZCBh
dCB2OVsxXQo+ID4gPgo+ID4gPiBbLi4uXQo+ID4KPiA+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0
aCBsaW5rczoKPiA+ICAgLSBbdjEwLDAxLzEwXSByaXNjdjogQWRkIHN1cHBvcnQgZm9yIGtlcm5l
bCBtb2RlIHZlY3Rvcgo+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9jMGFl
MzUwZjcxNGYKPiA+ICAgLSBbdjEwLDAyLzEwXSByaXNjdjogdmVjdG9yOiBtYWtlIFZlY3RvciBh
bHdheXMgYXZhaWxhYmxlIGZvciBzb2Z0aXJxIGNvbnRleHQKPiA+ICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3Jpc2N2L2MvZWJmNTJhYzMwZTRmCj4gPiAgIC0gW3YxMCwwMy8xMF0gcmlzY3Y6
IEFkZCB2ZWN0b3IgZXh0ZW5zaW9uIFhPUiBpbXBsZW1lbnRhdGlvbgo+ID4gICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy85ZmY5NzIxMWE2MjMKPiA+ICAgLSBbdjEwLDA0LzEwXSBy
aXNjdjogc2NoZWQ6IGRlZmVyIHJlc3RvcmluZyBWZWN0b3IgY29udGV4dCBmb3IgdXNlcgo+ID4g
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9mNDQ3MTI1MmYzYjkKPiA+ICAgLSBb
djEwLDA1LzEwXSByaXNjdjogbGliOiB2ZWN0b3JpemUgY29weV90b191c2VyL2NvcHlfZnJvbV91
c2VyCj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzE0NWNhNmVkZGQ3MAo+
ID4gICAtIFt2MTAsMDYvMTBdIHJpc2N2OiBmcHU6IGRyb3AgU1JfU0QgYml0IGNoZWNraW5nCj4g
PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzI1YTgzMDk0NDc3Mwo+ID4gICAt
IFt2MTAsMDcvMTBdIHJpc2N2OiB2ZWN0b3I6IGRvIG5vdCBwYXNzIHRhc2tfc3RydWN0IGludG8g
cmlzY3Zfdl92c3RhdGVfe3NhdmUscmVzdG9yZX0oKQo+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcmlzY3YvYy85ZGVjZThiZjAzNDMKPiA+ICAgLSBbdjEwLDA4LzEwXSByaXNjdjogdmVj
dG9yOiB1c2UgYSBtYXNrIHRvIHdyaXRlIHZzdGF0ZV9jdHJsCj4gPiAgICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9yaXNjdi9jL2MwNTk5Mjc0N2M5Ngo+ID4gICAtIFt2MTAsMDkvMTBdIHJpc2N2
OiB2ZWN0b3I6IHVzZSBrbWVtX2NhY2hlIHRvIG1hbmFnZSB2ZWN0b3IgY29udGV4dAo+ID4gICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy82NjAyMTc0Mjk2MTQKPiA+ICAgLSBbdjEw
LDEwLzEwXSByaXNjdjogdmVjdG9yOiBhbGxvdyBrZXJuZWwtbW9kZSBWZWN0b3Igd2l0aCBwcmVl
bXB0aW9uCj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2FhMjNjNjE3MmQz
Mwo+ID4KPiBXaXRoIHRoaXMgc2VyaWVzIG1lcmdlZCBpbiBSWi9GaXZlIHN0b3BzIGJvb3Rpbmcg
WzBdLCBJIGRvbnQgZ2V0IGFueQo+IHBhbmljIGFzIHN1Y2ggYnV0IGl0J3MgYSBrZXJuZWwgZnJl
ZXplLiBSZXZlcnRpbmcgdGhpcyBzZXJpZXMgYWxsCj4gYm9vdHMgdXAgT0suCj4KPiBbMF0gaHR0
cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0L2hpZGRlbi9hODI5MzI0MC8KClRoYW5rcyBmb3IgdGhlIG5v
dGUuCgpVbmZvcnR1bmF0ZWx5IEkgZGlkbid0IGZpbmQgYSBkaXJlY3QgY2x1ZSBvZiBmYWlsdXJl
IGZyb20geW91ciBsb2cuCkJ1dCBJIGJlbGlldmUgdGhpcyBpcyB0aGUgc2FtZSBjYXNlIGFzIHRo
ZSBhbHBpbmUgb25lIGFib3ZlLCBiZWNhdXNlCnRoZXkgd291bGQgZmFpbCB2ZXJ5IGVhcmx5LiBJ
IGhhdmUgdXBkYXRlZCBhIGJyYW5jaCBoZXJlWzBdLiBJdCBzaG91bGQKYmUgZml4ZWQgbm93LiBB
bHNvLCBpdCBzaG91bGQgZml4IHRoZSBib290IGZhaWx1cmUgdGhhdCBhcHBlYXJzIG9uClVidW50
dS4gSXQgd291bGQgYmUgbmljZSBpZiB5b3UgY291bGQgaGF2ZSBhIHRyeS4gSSB3aWxsIHNlbmQg
aXQgb3V0CmFzIHYxMSBpZiBubyBmdXJ0aGVyIGlzc3VlIGlzIGRldGVjdGVkIGJlZm9yZSB0aGUg
d2VlayBlbmRzLgoKWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmUvcmlzY3YtbGludXgvdHJl
ZS8yYjI1ZGYyYWQzYTM2NTFiYzFmNzdmZWM2NWM5NWExYWU2NTZkNjc1Cgo+Cj4gQ2hlZXJzLAo+
IFByYWJoYWthcgo+Cj4gPiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKPiA+IC0tCj4gPiBE
ZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90Lgo+ID4gaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9y
Zy9wYXRjaHdvcmsvcHdib3QuaHRtbAo+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKVGhhbmtzLApBbmR5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
