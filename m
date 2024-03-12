Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5219C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 03:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V55R42KN28/66J0vTdNdUyG1nmTEgTaNuaGSofQwHrA=; b=aN6RedJKdXD9AN
	5EN+j/dQjEWiw/x635HeMhpmcwOO1t+NWIiInYWg3VyNQctY4beZSOpybZufvCMp5QhpwLrFwDRfl
	kyrvpF+bzW//h4NaefTWflUvC5gTOSU9wVrtpLGasu7NElsRNTz2W04euOMdR+oeSjPIxVwwihoS8
	IZNDPjXu/203a80Mabc2Yzv9SAXG+ejS+FaTH9d26fNg6OVwyr5Pi3Vue0Es7SgHvOo+jOF51lQZZ
	S/arkQ7StheQbrh+M/FJs0CDnQcuDxRdhpG2u4berwTwy7I5EmncdHYXL9hcdfNqSjXT8eFmNEHIQ
	plBDCISw6EGECSrE2OTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjsaf-000000046yc-0tBk;
	Tue, 12 Mar 2024 03:14:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjsac-000000046wE-0w3L
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 03:14:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29b7b9a4908so2257163a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 20:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710213241; x=1710818041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXlf8eE/kb9hUjEHRg6KiaZYrPX7zppIuDOk01qdNjA=;
        b=VUem6eunmudXCGXDpeNGUrnuyyz2QLWoH6kPc5lngnbFtYkUpzRjwxw8f3m5A+Kh1k
         wc/fEzKhCiyMAFajwCBwXzB0dQBRfEfG+tq8egwpcPylzF551PxnKDayL1fbrvt/7wHW
         UbD8vE0c1SylmKkh+bxjvXXluCGw63bCdE++cC2bMr17qlx8b/XwYYyK13Xoy65TMJAZ
         GOycqgjv287qXWSchwKLhAacj5+mJ2f/aTdNoVaCYdHA8Rux77UFRfw/P9DBPM0uLHbB
         ep3y/eQvlpIXn9A8BLTruEvSUg0wLjJ0/FV7U3WDeyT113jq9t2QYfZdzJ/f+l7eSCPw
         Xvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710213241; x=1710818041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXlf8eE/kb9hUjEHRg6KiaZYrPX7zppIuDOk01qdNjA=;
        b=sGEBs19Xjnz7jVuPkKgLjFIB5BDBqOyuqwMYVttyUNokAL9op/1/krVU9qt3hnF73Q
         Htj7v8h9vpsLux1ucmeSBKq+hDzDRa2AHNAabrbpIlof4VkhAfx/IX6CemTGz3orbxob
         I2bgAPm98BN3tEDZtCmg/W1J25pDNe9E2e5T8xP3D2xY9rSg2WaZffEDsyYRDk49g943
         piAh08sHAKFSesEr7jVqK0/fcGtVgHtTazT9dY6cXiUfmx0I2wdJYBFIF13Oca9pIqZp
         HKgVwFsptZWopOwIEJjuF164Z5lWtNsRbN/eRrxZmWY68pYhzTrO4nQ91dqKunFS3yPz
         ve/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWe/NZ/gmMiwYdUlevVEzIf8ikXqNdaEbCCt5833h/l8UcHhLjyx8b0Nu+0fpglDoBl8QTuQ0CjCjsZCkTAShy4ISXgqc66hIcomSwxXhvR
X-Gm-Message-State: AOJu0YyokRPRwVPHYLcJ+pLjkCjcF+ZWlpi7omsfLX7N4ejgHpzR2eWK
	6gMK5bqimKYWAjt0yM+BHOD1sUK2+SWVDixAq04Apayiru/msGA9wm6L2hBR5/XLDoluICc5Daz
	QSalEeEtbBDgoEBIzTVWXJUDY3F46YRe5CilzuQ==
X-Google-Smtp-Source: AGHT+IFrJd1b6cRe3N1bdjRPMDm6UQYIWuBJWFP813OtCjwvKtB/NBwZvIOHJ5+UKRNsfrlwra9CEE8kwZK9x+jxh4c=
X-Received: by 2002:a17:90a:c684:b0:299:5b95:cd7d with SMTP id
 n4-20020a17090ac68400b002995b95cd7dmr5190887pjt.45.1710213241618; Mon, 11 Mar
 2024 20:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-6-dongmenglong.8@bytedance.com> <CAADnVQKw4HUbwvivysVBQPpA2MC2e56MwrvJy89qs8rx_ixOnw@mail.gmail.com>
In-Reply-To: <CAADnVQKw4HUbwvivysVBQPpA2MC2e56MwrvJy89qs8rx_ixOnw@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 11:13:50 +0800
Message-ID: <CALz3k9iiP5msNtL5c0ZhwRoYyEZtxZoWGbFiPrVcL3To6hj4wQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 5/9] bpf: verifier: add btf to
 the function args of bpf_check_attach_target
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_201406_615340_ACD20037 
X-CRM114-Status: GOOD (  23.01  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1MeKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgdGFyZ2V0IGJ0ZiB0byB0aGUgZnVuY3Rpb24gYXJncyBv
ZiBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLCB0aGVuCj4gPiB0aGUgY2FsbGVyIGNhbiBzcGVj
aWZ5IHRoZSBidGYgdG8gY2hlY2suCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWVuZ2xvbmcgRG9u
ZyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGlu
dXgvYnBmX3ZlcmlmaWVyLmggfCAxICsKPiA+ICBrZXJuZWwvYnBmL3N5c2NhbGwuYyAgICAgICAg
IHwgNiArKysrLS0KPiA+ICBrZXJuZWwvYnBmL3RyYW1wb2xpbmUuYyAgICAgIHwgMSArCj4gPiAg
a2VybmVsL2JwZi92ZXJpZmllci5jICAgICAgICB8IDggKysrKystLS0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L2JwZl92ZXJp
Zmllci5oCj4gPiBpbmRleCA0YjBmNjYwMGU0OTkuLjZjYjIwZWZjZmFjMyAxMDA2NDQKPiA+IC0t
LSBhL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgv
YnBmX3ZlcmlmaWVyLmgKPiA+IEBAIC04MTEsNiArODExLDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGJwZl90cmFtcG9saW5lX3VucGFja19rZXkodTY0IGtleSwgdTMyICpvYmpfaWQsIHUzMiAqYnRm
X2lkKQo+ID4gIGludCBicGZfY2hlY2tfYXR0YWNoX3RhcmdldChzdHJ1Y3QgYnBmX3ZlcmlmaWVy
X2xvZyAqbG9nLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBi
cGZfcHJvZyAqcHJvZywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgYnBmX3Byb2cgKnRndF9wcm9nLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBidGYgKmJ0ZiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYnRmX2lk
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBicGZfYXR0YWNoX3Rhcmdl
dF9pbmZvICp0Z3RfaW5mbyk7Cj4gPiAgdm9pZCBicGZfZnJlZV9rZnVuY19idGZfdGFiKHN0cnVj
dCBicGZfa2Z1bmNfYnRmX3RhYiAqdGFiKTsKPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL3N5
c2NhbGwuYyBiL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4gPiBpbmRleCBkMWNkNjQ1ZWY5YWMuLjYx
MjhjMzEzMTE0MSAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4gPiArKysg
Yi9rZXJuZWwvYnBmL3N5c2NhbGwuYwo+ID4gQEAgLTM0MDEsOSArMzQwMSwxMSBAQCBzdGF0aWMg
aW50IGJwZl90cmFjaW5nX3Byb2dfYXR0YWNoKHN0cnVjdCBicGZfcHJvZyAqcHJvZywKPiA+ICAg
ICAgICAgICAgICAgICAgKiBuZWVkIGEgbmV3IHRyYW1wb2xpbmUgYW5kIGEgY2hlY2sgZm9yIGNv
bXBhdGliaWxpdHkKPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAgICBz
dHJ1Y3QgYnBmX2F0dGFjaF90YXJnZXRfaW5mbyB0Z3RfaW5mbyA9IHt9Owo+ID4gKyAgICAgICAg
ICAgICAgIHN0cnVjdCBidGYgKmJ0ZjsKPiA+Cj4gPiAtICAgICAgICAgICAgICAgZXJyID0gYnBm
X2NoZWNrX2F0dGFjaF90YXJnZXQoTlVMTCwgcHJvZywgdGd0X3Byb2csIGJ0Zl9pZCwKPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdGd0X2luZm8pOwo+
ID4gKyAgICAgICAgICAgICAgIGJ0ZiA9IHRndF9wcm9nID8gdGd0X3Byb2ctPmF1eC0+YnRmIDog
cHJvZy0+YXV4LT5hdHRhY2hfYnRmOwo+Cj4gSSB0aGluayBpdCdzIGJldHRlciB0byBrZWVwIHRo
aXMgYml0IGluc2lkZSBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLAo+IHNpbmNlIGEgbG90IG9m
IG90aGVyIGNvZGUgaW4gdGhlcmUgaXMgd29ya2luZyB3aXRoIGlmICh0Z3RfcHJvZykgLi4uCj4g
c28gaWYgdGhlIGNhbGxlciBtZXNzZXMgdXAgcGFzc2luZyB0Z3RfcHJvZy0+YXV4LT5idGYgd2l0
aCB0Z3RfcHJvZwo+IHRoZSBidWcgd2lsbCBiZSBkaWZmaWN1bHQgdG8gZGVidWcuCgpJbiB0aGUg
cHJldmlvdXMgdmVyc2lvbiwgSSBwYXNzIHRoZSBhdHRhY2hfYnRmIHdpdGggdGhlIGZvbGxvd2lu
Zwp3YXk6CgorICAgICAgICAgICAgb3JpZ2luX2J0ZiA9IHByb2ctPmF1eC0+YXR0YWNoX2J0ZjsK
KyAgICAgICAgICAgICAvKiB1c2UgdGhlIG5ldyBhdHRhY2hfYnRmIHRvIGNoZWNrIHRoZSB0YXJn
ZXQgKi8KKyAgICAgICAgICAgICBwcm9nLT5hdXgtPmF0dGFjaF9idGYgPSBhdHRhY2hfYnRmOwog
ICAgICAgICAgICAgIGVyciA9IGJwZl9jaGVja19hdHRhY2hfdGFyZ2V0KE5VTEwsIHByb2csIHRn
dF9wcm9nLCBidGZfaWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnRndF9pbmZvKTsKKyAgICAgICAgICAgICBwcm9nLT5hdXgtPmF0dGFjaF9idGYgPSBvcmln
aW5fYnRmOwoKQW5kIEppcmkgc3VnZ2VzdGVkIHRvIGFkZCB0aGUgYXR0YWNoX2J0ZiB0byB0aGUg
ZnVuY3Rpb24gYXJncwpvZiBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLgoKRW5ubi4uLi5TaG91
bGQgSSBjb252ZXJ0IHRvIHRoZSBvbGQgd2F5PwoKVGhhbmtzIQpNZW5nbG9uZyBEb25nCgo+Cj4g
PiArICAgICAgICAgICAgICAgZXJyID0gYnBmX2NoZWNrX2F0dGFjaF90YXJnZXQoTlVMTCwgcHJv
ZywgdGd0X3Byb2csIGJ0ZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBidGZfaWQsICZ0Z3RfaW5mbyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
