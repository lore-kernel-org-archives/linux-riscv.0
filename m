Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDD8C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 04:27:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0858120725
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 04:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kuJGH01v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="apwY8yjn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0858120725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8lSLXBOxE+fU4o2GML8pf3vamks6m6AF7WYSrknR6i0=; b=kuJGH01vgIEV+NrX4WHpIUdrI
	l3aoZCK8V2i60u3EDKN8v6SpMb9VStTf2bcZ6Z2aukb5eAt4ZTSgxHZg19C5kcqWJXTsvGXO2Lzbx
	+V2Dd2u3PaG7ef8gj7UV9D9RKZJbwZMTZc1OoJVLY+s60/jm6+z6Hpdxrvn719Mm6UXF6jEEQY/Tg
	46XtOEecUZnNVJ9NAP42uGvrQI4Y/i5+XYr7YSM3TM6PuBhQ+qKgNwN9uXOV/CjZ75NQPV83BO8N4
	rjPPfwfzQYyEwqlXtuiwNUvNoazpmhaexfKNO0zZddwZEpk9dqowH9JClUXxtKD1Fjk3Dqm+ILZ6j
	2quKXeTTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju76v-00048M-0W; Sat, 11 Jul 2020 04:27:37 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju76r-00047p-QH
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 04:27:34 +0000
Received: by mail-pl1-x643.google.com with SMTP id p1so3063435pls.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 21:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=s199aw7gACo2V2pxPMbOkqhVWvVnsPCcR2goy3FQ+MM=;
 b=apwY8yjn7ouF2qoi06y4Cze6EAEsKFa0Yl8T96s1HcUYikGoquwaQJMcHPdriASRGH
 8dvO/+RFclp5XQl62YFHfXsUqRquuyq7eU6o/X+h9A/grcQ0NP9kefMsU3X7WE15lzBL
 89RNJP/tYutgq8Iaxtj2U1QoNH0/ZCOoRLGfWrzcIApD2VCsaq7WAyu0+DpMEqoIXl16
 6WApu3tHvHETag+03MvH3rcnWxQM0x8FQQYw3XJx3YxenwWrTehtW4VgkaTjjhyR9pXK
 XCrA+xkYyNsEpN0aJc9k6Ev/8r3S8r7g48p8NchyzSuzKss5SciOB5+KZOA1iawk+abC
 5LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=s199aw7gACo2V2pxPMbOkqhVWvVnsPCcR2goy3FQ+MM=;
 b=JNh783Demnj0JyBLI0/ogUUr7MD+okJL77UpMZRy+m9zFQ6FoMpI7GiXWq95sbruzU
 JeDwKw+5bguQEU7vXB/ZFYDKv4Lbw1zEKNyDgxrga50Hmr6iZD4aGRrTzJwnAqrSLxHX
 d2WFm0kmEoBaiJezIrgqzEh+87ZOHjWoPvmLeOgRH5SSvFDnWmT81EKTaUtjEPa7cM5t
 gXqau7PDruj+j8Jp9eLt82r/UZhgF0llv9QMay1cbrtcuqNYDL7L4td0s0N1c0YXY8a8
 bplE26Ihev7VAXypPzY0oT4gAdE90DshqZstkAISrmi+oLketGly9Hd0YBzWbG05nVKS
 e4eQ==
X-Gm-Message-State: AOAM531WTF039KnGV+zIfEOnQ/kZZKkzNHcv3W9mn+JyERwp6Z2iahMO
 0ShcnPnLXLWbffVIAWmk3GaqNA==
X-Google-Smtp-Source: ABdhPJwJO4NHu3MJeq/VfzDPjkxm32PdfxWqHvEFAkZPGoAAsGH7cOJo8jDHpVYmlpdOI17Yb7kKuw==
X-Received: by 2002:a17:90a:a413:: with SMTP id
 y19mr8819172pjp.59.1594441651336; 
 Fri, 10 Jul 2020 21:27:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 22sm7495377pfh.157.2020.07.10.21.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 21:27:30 -0700 (PDT)
Date: Fri, 10 Jul 2020 21:27:30 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 21:27:21 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Allow building with kcov coverage
In-Reply-To: <20200626124056.29708-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-5606ac04-c52e-4211-bd30-fce86df7f0fd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_002733_888741_18FAC0CB 
X-CRM114-Status: GOOD (  16.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Bjorn Topel <bjorn.topel@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNiBKdW4gMjAyMCAwNTo0MDo1NiBQRFQgKC0wNzAwKSwgdGtsYXVzZXJAZGlzdGFu
ei5jaCB3cm90ZToKPiBBZGQgQVJDSF9IQVNfS0NPViBhbmQgSEFWRV9HQ0NfUExVR0lOUyB0byB0
aGUgcmlzY3YgS2NvbmZpZy4KPiBBbHNvIGRpc2FibGUgaW5zdHJ1bWVudGF0aW9uIG9mIHNvbWUg
ZWFybHkgYm9vdCBjb2RlIGFuZCB2ZHNvLgo+Cj4gQm9vdC10ZXN0ZWQgb24gUUVNVSdzIHJpc2N2
NjQgdmlydCBtYWNoaW5lLgoKVGhhbmtzLiAgVGhpcyBpcyBvbiBmb3ItbmV4dCAod2l0aCB0aGUg
YWNrKS4gIEknbSBib290IHRlc3RpbmcgYSBjb25maWcgd2l0aAoKICAgIENPTkZJR19LQ09WPXkK
ICAgIENPTkZJR19LQ09WX0VOQUJMRV9DT01QQVJJU09OUz15CgpidXQgTE1LIGlmIHRoZXJlJ3Mg
c29tZXRoaW5nIG1vcmUgaW50ZXJlc3RpbmcgdG8gdGVzdC4gIEkgZG9uJ3Qgc2VlIGFueXRoaW5n
CmNvdmVyYWdlLXJlbGF0ZWQgaW4gdGhlIGJvb3QgbG9nLi4uCgo+IENjOiBCasO2cm4gVMO2cGVs
IDxiam9ybi50b3BlbEBnbWFpbC5jb20+Cj4gQ2M6IERtaXRyeSBWeXVrb3YgPGR2eXVrb3ZAZ29v
Z2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUb2JpYXMgS2xhdXNlciA8dGtsYXVzZXJAZGlzdGFu
ei5jaD4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICB8IDIgKysKPiAg
YXJjaC9yaXNjdi9ib290L01ha2VmaWxlICAgICAgICB8IDIgKysKPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvdmRzby9NYWtlZmlsZSB8IDEgKwo+ICBhcmNoL3Jpc2N2L21tL01ha2VmaWxlICAgICAgICAg
IHwgMiArKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDA4OTI5
M2U0YWQ0Ni4uYTdkN2Y4MTg0ZjE1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0xOSw2ICsxOSw3IEBAIGNvbmZpZyBSSVND
Vgo+ICAJc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1dYCj4gIAlzZWxlY3QgQVJDSF9IQVNfR0NPVl9Q
Uk9GSUxFX0FMTAo+ICAJc2VsZWN0IEFSQ0hfSEFTX0dJR0FOVElDX1BBR0UKPiArCXNlbGVjdCBB
UkNIX0hBU19LQ09WCj4gIAlzZWxlY3QgQVJDSF9IQVNfTU1JT1dCCj4gIAlzZWxlY3QgQVJDSF9I
QVNfUFRFX1NQRUNJQUwKPiAgCXNlbGVjdCBBUkNIX0hBU19TRVRfRElSRUNUX01BUAo+IEBAIC01
Nyw2ICs1OCw3IEBAIGNvbmZpZyBSSVNDVgo+ICAJc2VsZWN0IEhBVkVfRE1BX0NPTlRJR1VPVVMg
aWYgTU1VCj4gIAlzZWxlY3QgSEFWRV9FQlBGX0pJVCBpZiBNTVUKPiAgCXNlbGVjdCBIQVZFX0ZV
VEVYX0NNUFhDSEcgaWYgRlVURVgKPiArCXNlbGVjdCBIQVZFX0dDQ19QTFVHSU5TCj4gIAlzZWxl
Y3QgSEFWRV9HRU5FUklDX1ZEU08gaWYgTU1VICYmIDY0QklUCj4gIAlzZWxlY3QgSEFWRV9QQ0kK
PiAgCXNlbGVjdCBIQVZFX1BFUkZfRVZFTlRTCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZQo+IGluZGV4IDM1MzBjNTliM2Vh
Ny4uYzU5ZmNhNjk1ZjlkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZQo+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZQo+IEBAIC0xNCw2ICsxNCw4IEBACj4gICMg
QmFzZWQgb24gdGhlIGlhNjQgYW5kIGFybTY0IGJvb3QvTWFrZWZpbGUuCj4gICMKPgo+ICtLQ09W
X0lOU1RSVU1FTlQgOj0gbgo+ICsKPiAgT0JKQ09QWUZMQUdTX0ltYWdlIDo9LU8gYmluYXJ5IC1S
IC5ub3RlIC1SIC5ub3RlLmdudS5idWlsZC1pZCAtUiAuY29tbWVudCAtUwo+Cj4gIHRhcmdldHMg
Oj0gSW1hZ2UgbG9hZGVyCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFr
ZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gaW5kZXggMjljZjA1MmY2
NTQxLi40YjBkM2JjYzQ0ZTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9N
YWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiBAQCAtMjks
NiArMjksNyBAQCBDUFBGTEFHU192ZHNvLmxkcyArPSAtUCAtQyAtVSQoQVJDSCkKPgo+ICAjIERp
c2FibGUgZ2NvdiBwcm9maWxpbmcgZm9yIFZEU08gY29kZQo+ICBHQ09WX1BST0ZJTEUgOj0gbgo+
ICtLQ09WX0lOU1RSVU1FTlQgOj0gbgo+Cj4gICMgRm9yY2UgZGVwZW5kZW5jeQo+ICAkKG9iaikv
dmRzby5vOiAkKG9iaikvdmRzby5zbwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL01ha2Vm
aWxlIGIvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+IGluZGV4IDM2M2VmMDFjMzBiMS4uYzAxODVl
NTU2Y2E1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUKPiArKysgYi9hcmNo
L3Jpc2N2L21tL01ha2VmaWxlCj4gQEAgLTUsNiArNSw4IEBAIGlmZGVmIENPTkZJR19GVFJBQ0UK
PiAgQ0ZMQUdTX1JFTU9WRV9pbml0Lm8gPSAtcGcKPiAgZW5kaWYKPgo+ICtLQ09WX0lOU1RSVU1F
TlRfaW5pdC5vIDo9IG4KPiArCj4gIG9iai15ICs9IGluaXQubwo+ICBvYmoteSArPSBleHRhYmxl
Lm8KPiAgb2JqLSQoQ09ORklHX01NVSkgKz0gZmF1bHQubyBwYWdlYXR0ci5vCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
