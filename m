Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D771C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 06:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGXOvvRhEHQOXZnY2VxBFIGc7fFxd4hHgmSx2kLomgA=; b=jIFpKIko71M6WO
	s0GYML7mWdaqOvAYbEew8fGQxJMyWAIoTr99Lwx4Jt4s/ONE8MRlXvgEpehHHjXK+j38cMB6bcjTx
	v2fMKmeMKVyz99+XBAaK2YaH5MXqH21Q1O00WJitnf8lYyzuDb74a0G1T3ZRkDoqIs1uu+nTLqWXJ
	tEq4Pc3SFECHdfa5w/4q1ogS/F86oV+3bu7JmdE2j2CxeIAfAY/g0w+UfuG2jN506yfhtyb07tE8D
	Cj9N8nWz/7xGVngkIYv9Px55LN4tj0MwvRNslkYaWiVCVofKx/gvFjVrQPzdN7wjsG/yh+lZa03yb
	cTZD8iKwE2IF+zJD6mRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFq7s-00GIyU-1m;
	Wed, 20 Dec 2023 06:32:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFq7p-00GIxw-30
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 06:32:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso62709125e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 22:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703053932; x=1703658732; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ljoOXU7dM/4xhuAcxiFqwp6oUgqoh+Yh28AnmfqG6tM=;
        b=BCv90BJ1p5qIbrJZzKx3Pe2NHj4XJq9pZeXLsXO1JGNOSW8qDEZT3/hHiI89GwTok2
         W6haUV7prFErD85ojsLDLSdN2geq0ADaI/ZK+e6P+nBiPPSw6AmjT0GsPjgb2vWYArT/
         gB4iIKB+QVzGuTpAtrluQtPxBPQ2VvB7+KD0nqcEv3rl7fO3FFh5IC3iSph++ASN3xo5
         8aApzJ3po8pG1FlvQK4FjEJo94r5qLVvJR8PLcb9Zo1kju7Wg5Akt4bpvqPnqBrL85MF
         Ug6KzemZ2BqIxa5NNgcm9bKHzcbYxrqXMXrjCgk87EFmoBKqIaYAD0cMLnFR63gX11rG
         SIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703053932; x=1703658732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljoOXU7dM/4xhuAcxiFqwp6oUgqoh+Yh28AnmfqG6tM=;
        b=lbvdPW//fIXQu8ULCvXmYRRyRCKOTWZFfUSrEoMljXDaHy57xk77cv4fEfm3Rieuji
         OYBuvW6m7IWRAANgasa+875pNL6nilWi3MDeXvogSiTmeeHV2kOa2vcQqcDoT1r19cAc
         WyRttzaZmA5MCHd9N6WyOqzvVCHyDicKdnbNKIMnKlhMd6C94o2m78bxGr9MBUKcGnFG
         CpXIdEF17jwLxelbxpN3yJe5xnmeDBTt2FajTGCRE+JCxk76d3lwbIsdzninQTjrYdsf
         J55nqPVsnPKQ758M+pbgH4m6TdOud0+ewp5PYBbpKwBscQidWQaxxaWnW2UdUv3xMERK
         0vqw==
X-Gm-Message-State: AOJu0YzvopLVEx0iF8cQKp3WS+E72OTsUKM8sGxQmhfAlBuWDngEGmMl
	qCfMHcQOrLJOCDqoqosf+yTBDcLDD5MAT4UdAvyWZA==
X-Google-Smtp-Source: AGHT+IGmP6oLdWYoNgJnFzkf7BpxRCt/SjM4/QOIlc8F05xBQ7SLBG/FHbNnZAcyv67HwgTU96GYkQ==
X-Received: by 2002:a05:600c:a3af:b0:40c:2c36:2a23 with SMTP id hn47-20020a05600ca3af00b0040c2c362a23mr9512791wmb.180.1703053932493;
        Tue, 19 Dec 2023 22:32:12 -0800 (PST)
Received: from localhost (cst-prg-1-247.cust.vodafone.cz. [46.135.1.247])
        by smtp.gmail.com with ESMTPSA id t15-20020a0560001a4f00b003367d48520dsm253699wry.46.2023.12.19.22.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 22:32:12 -0800 (PST)
Date: Wed, 20 Dec 2023 07:32:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, guoren@kernel.org, 
	conor.dooley@microchip.com
Subject: Re: [PATCH v3 07/13] RISC-V: KVM: Add support for SBI extension
 registers
Message-ID: <20231220-b68357fb121f79bec9dd1a24@orel>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
 <20231217204019.36492-22-ajones@ventanamicro.com>
 <CAOnJCU+h_ed-x7L5oFwWTWoKAq8M3Vk8XUQo1-jhPPaty5Y7Jg@mail.gmail.com>
 <CAK9=C2XQb3=PbU+Ggpp1jEnDbc-DER+eEY9j=w8w=_6DNjcdDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XQb3=PbU+Ggpp1jEnDbc-DER+eEY9j=w8w=_6DNjcdDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_223213_968086_67B661C6 
X-CRM114-Status: GOOD (  22.04  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMTE6NDk6NDZBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIERlYyAyMCwgMjAyMyBhdCAxOjI44oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNo
cEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBEZWMgMTcsIDIwMjMgYXQg
MTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gU29tZSBTQkkgZXh0ZW5zaW9ucyBoYXZlIHN0YXRlIHRoYXQgbmVlZHMgdG8g
YmUgc2F2ZWQgLyByZXN0b3JlZAo+ID4gPiB3aGVuIG1pZ3JhdGluZyB0aGUgVk0uIFByb3ZpZGUg
YSBnZXQvc2V0LW9uZS1yZWcgcmVnaXN0ZXIgdHlwZQo+ID4gPiBmb3IgU0JJIGV4dGVuc2lvbiBy
ZWdpc3RlcnMuIEVhY2ggU0JJIGV4dGVuc2lvbiB0aGF0IHVzZXMgdGhpcyB0eXBlCj4gPiA+IHdp
bGwgaGF2ZSBpdHMgb3duIHN1YnR5cGUuIFRoZXJlIGFyZSBjdXJyZW50bHkgbm8gc3VidHlwZXMg
ZGVmaW5lZC4KPiA+ID4gVGhlIG5leHQgcGF0Y2ggaW50cm9kdWNlcyB0aGUgZmlyc3Qgb25lLgo+
ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
IHwgIDQgKysKPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgfCAg
MyArKwo+ID4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICB8IDQyICsr
KysrKysrKysrKysrKysrLS0KPiA+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAg
ICAgICAgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgMTAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gPiBpbmRleCA5OWMyM2JiMzdhMzcuLmRk
NjBmNzNiNWMzNiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmkuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Ni
aS5oCj4gPiA+IEBAIC02MCw2ICs2MCwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3JlZ19z
YmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX29uZV9yZWcgKnJlZyk7Cj4gPiA+ICBpbnQg
a3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX29u
ZV9yZWcgKnJlZyk7Cj4gPiA+ICtpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3JlZ19zYmkoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGt2bV9vbmVfcmVnICpyZWcpOwo+ID4gPiAraW50IGt2bV9yaXNjdl92Y3B1X2dl
dF9yZWdfc2JpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fb25lX3JlZyAqcmVnKTsKPiA+ID4gIGNvbnN0
IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICprdm1fdmNwdV9zYmlfZmluZF9leHQoCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1bnNpZ25lZCBsb25nIGV4dGlkKTsKPiA+ID4gIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19z
YmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7Cj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKPiA+ID4gaW5kZXggZTk2MWQ3OTYyMmZiLi4zMGY4OWEwZTg1NWYgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ID4gQEAgLTI0Miw2ICsy
NDIsOSBAQCBlbnVtIEtWTV9SSVNDVl9TQklfRVhUX0lEIHsKPiA+ID4gICNkZWZpbmUgS1ZNX1JF
R19SSVNDVl9WRUNUT1JfUkVHKG4pICAgIFwKPiA+ID4gICAgICAgICAgICAgICAgICgobikgKyBz
aXplb2Yoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUpIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcp
KQo+ID4gPgo+ID4gPiArLyogUmVnaXN0ZXJzIGZvciBzcGVjaWZpYyBTQkkgZXh0ZW5zaW9ucyBh
cmUgbWFwcGVkIGFzIHR5cGUgMTAgKi8KPiA+ID4gKyNkZWZpbmUgS1ZNX1JFR19SSVNDVl9TQkkg
ICAgICAgICAgICAgICgweDBhIDw8IEtWTV9SRUdfUklTQ1ZfVFlQRV9TSElGVCkKPiA+ID4gKwo+
ID4KPiA+Cj4gPiBuaXQgY29tbWVudDogS1ZNX1JFR19SSVNDVl9TQkkgbG9va3MgYml0IG9kZCB3
aGVuIHdlIGFscmVhZHkgaGF2ZQo+ID4gS1ZNX1JFR19SSVNDVl9TQklfRVhUIGZvcgo+ID4gZXh0
ZW5zaW9uIGVuYWJsaW5nL2Rpc2FibGluZy4KPiA+Cj4gPiBIb3cgYWJvdXQgcmVuYW1pbmcgdGhp
cyB0byBLVk1fUkVHX1JJU0NWX1NCSV9FWFRfU1RBVEUgb3Igc29tZXRoaW5nCj4gPiBzaW1pbGFy
IGluZGljYXRlIHRoYXQgdGhpcwo+ID4gZm9yIGEgc3BlY2lmaWMgZXh0ZW5zaW9uIHN0YXRlID8K
PiAKPiBIb3cgYWJvdXQgS1ZNX1JFR19SSVNDVl9TQklfU1RBVEUgID8KCkFsc28gd29ya3MgZm9y
IG1lLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
