Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B605C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 16:34:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA7E223E8
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 16:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA7E223E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zMlPC9WVTNyYIz+QhEMY2OFAiZP57kvQr9hb1jLHrcg=; b=SBbI77ddTUID0x7FZLCHL2GtN
	41W8gkBUN5cRaH/RLBnOWwNqgELRtdIK/i5YFDprfZGW9whYUIXlJovlXETo9VJDhx8OMOaA2rxVA
	8WeHx4bxW+J6aDFbyfI7evojSPL3oHGwFHzAdMBSYFF9d3il6mHF0Iwq+XbBCvXJEKzuPAr+FS165
	bh/tTGuOR1bD6gQutJijlCOvivdVUiqz5YTLaxYdxwT/EDaLcIIKROjMS1VLeJxdRGNyUxMoTB0z2
	/DXd8BT2XyQNHWzmyHcT+1SjFkmWTDdHPxQThZ6yluU4jGyD2ne/rbsnprQxE14mOIzcaOkw6ozZw
	ZuAVfR0hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1XTy-0005Tn-93; Mon, 18 Jan 2021 16:34:22 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1XTw-0005SR-Ce
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 16:34:21 +0000
Received: by mail-ed1-f44.google.com with SMTP id d22so7261180edy.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 08:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=70JYencCI5GIK5ExOJUEk5bDZNHenGExsi/dk/7n5EI=;
 b=pUm/D5Jimxi8aiz3E9tngcOzbZtn47rKpar+kb7GTM1h2F5czfgWbEcQrqKa7y49ab
 KCmFCgcQ2Hlq2yY8gvFTZfY5rIMUuCB2tQFDLoTPl8r88JuCfwl/vBBC8MeSrUsU2GKA
 TqiyvAiYeqbCtHIHITT3bgt3C8UP7jBdqfdMFx+R3Qxsm0iNTIo/XQa/XCaaqoUsM4Ad
 rkU1q+Nrkhss4hkFfr3XSzqdkz0+3kk+YIKaLqjyo4aiakJUG51TXNm/6PLMspzmOud4
 p6nk1XvsOYubrs+M4l9iSkqEd8qrhVk2ZXKFNXgs+q9DqLlZTUS1fk/4ZaSAyBXZ4TWb
 ZSDg==
X-Gm-Message-State: AOAM533DYaATpCGKhSsx/HkqEKGX20F7PDEviIfQ1s0i7CIGbJXL5nJR
 pNmnZDKKnUP5sYCjzicqXEM=
X-Google-Smtp-Source: ABdhPJwmKpzDTb/TeFkj4aNRdGRrIfBHfW9mR58fO5psARoWJDK4qKQnmnR9/Sn7rc9T7SLIL2NDXQ==
X-Received: by 2002:aa7:d39a:: with SMTP id x26mr222292edq.51.1610987655250;
 Mon, 18 Jan 2021 08:34:15 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id cy13sm1644854edb.27.2021.01.18.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 08:34:14 -0800 (PST)
Date: Mon, 18 Jan 2021 17:34:10 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAW4gmkJzlG8kNf6@ingrassia.epigenesys.com>
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
 <CAK8P3a0kOi55Dg-P-v+GcKdoLY6VOvv5Lj63X1=vL9LDR=Fe9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0kOi55Dg-P-v+GcKdoLY6VOvv5Lj63X1=vL9LDR=Fe9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_113420_442478_7DE4DF5A 
X-CRM114-Status: GOOD (  22.95  )
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCk9uIE1vbiwgSmFuIDE4LCAyMDIxIGF0IDA0OjQ0OjM2UE0gKzAxMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4gT24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgNDozMyBQTSBFbWlsaWFu
byBJbmdyYXNzaWEKPiA8aW5ncmFzc2lhQGVwaWdlbmVzeXMuY29tPiB3cm90ZToKPgo+ID4gT2ss
IEkgdG90YWxseSBhZ3JlZSB3aXRoIHlvdSBvbiB0aGlzIHBvaW50Lgo+ID4KPiA+IFNvLCBpdCBp
cyByaWdodCB0byBjb25jbHVkZSB0aGF0IHRoZSBwcm9ibGVtIGlzIG5vdCBpbiBwZXJmCj4gPiBp
bXBsZW1lbnRhdGlvbiBidXQgaW4gdGhlIGxpYmMgaW1wbGVtZW50YXRpb24/Cj4KPiBObywgbGli
YyBkb2VzIG5vdCBwcm92aWRlIGEgZnV0ZXggYWJzdHJhY3Rpb24sIGFuZCB0aGUgU1lTXyogbWFj
cm9zCj4ganVzdCByZWZlciB0byB0aGUgbG93LWxldmVsIGludGVyZmFjZXMgdGhhdCBvcGVyYXRl
IG9uIGtlcm5lbCB0eXBlcyByYXRoZXIKPiB0aGFuIGxpYmMgdHlwZXMuIEFuIGFwcGxpY2F0aW9u
IHRoYXQgdXNlcyB0aGVtIG11c3QgcGFzcyB0aGUKPiBjb3JyZWN0IHR5cGVzLgo+Cj4gPiBUaGF0
IGlzLCBmb3IgZXhhbXBsZSwgZ2xpYmMgc2hvdWxkIGRlZmluZSBTWVNfZnV0ZXggYXMgU1lTX2Z1
dGV4X3RpbWU2NAo+ID4gaW4gY2FzZSBvZiByaXNjdiAzMiBiaXQgYmVjYXVzZSBvZiBpdHMgc3Vw
cG9ydCB0byA2NCBiaXQgdGltZV90Pwo+Cj4gQXMgSSBleHBsYWluZWQsIFNZU19mdXRleCB3b3Vs
ZCByZWZlciB0byB0aGUgdGltZTMyIHN5c2NhbGwsIHdoaWNoCj4gZG9lcyBub3QgZXhpc3Qgb24g
cnYzMiwgcmVkZWZpbmluZyBpdCB0byBhIGRpZmZlcmVudCBzeXNjYWxsIHdvdWxkIGxlYWQgdG8K
PiBkYXRhIGNvcnJ1cHRpb24gYXMgd2VsbC4KPgoKSSB0cmllZCB0byBhcHBseSB0aGUgcGF0Y2gg
eW91IHByb3Bvc2VkIGluIHlvdXIgZmlyc3QgcmVwbHk6Cgo+ICNpZmRlZiBfX05SX2Z1dGV4Cj4g
I2RlZmluZSBkb19mdXRleCAoc2l6ZW9mKHRpbWVfdCkgPT0gc2l6ZW9mKF9fa2VybmVsX2xvbmdf
dCkpID8gXAo+ICAgICAgICAgIF9fTlJfZnV0ZXggOiBfX05SX2Z1dGV4X3RpbWU2NAo+ICNlbHNl
Cj4gI2RlZmluZSBkb19mdXRleCBfX05SX2Z1dGV4Cj4gI2RvbmUKCmluIGEgc2ltcGxlIHVzZXIg
c3BhY2UgYXBwIHdoaWNoIGNhbGxzIGZ1dGV4IChJIGNoYW5nZWQgZG9fZnV0ZXggd2l0aApTWVNf
ZnV0ZXgpOgoKI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRl
IDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiNpbmNsdWRlIDxsaW51eC9mdXRl
eC5oPgojaW5jbHVkZSA8c3lzL3RpbWUuaD4KCiNpZmRlZiBfX05SX2Z1dGV4CiNkZWZpbmUgU1lT
X2Z1dGV4IChzaXplb2YodGltZV90KSA9PSBzaXplb2YoX19rZXJuZWxfbG9uZ190KSkgPyBcCgkJ
CQkgICAgICAgICAgIF9fTlJfZnV0ZXggOiBfX05SX2Z1dGV4X3RpbWU2NAojZWxzZQojZGVmaW5l
IFNZU19mdXRleCBfX05SX2Z1dGV4CiNlbmRpZgoKc3RhdGljIGludApmdXRleCh1aW50MzJfdCAq
dWFkZHIsIGludCBmdXRleF9vcCwgdWludDMyX3QgdmFsLAogICAgICBjb25zdCBzdHJ1Y3QgdGlt
ZXNwZWMgKnRpbWVvdXQsIHVpbnQzMl90ICp1YWRkcjIsIHVpbnQzMl90IHZhbDMpCnsKCXJldHVy
biBzeXNjYWxsKFNZU19mdXRleCwgdWFkZHIsIGZ1dGV4X29wLCB2YWwsIHRpbWVvdXQsIHVhZGRy
MiwgdmFsMyk7Cn0KCmludCBtYWluKHZvaWQpCnsKCXJldHVybiBmdXRleChOVUxMLCBGVVRFWF9X
QUtFLCAwLCBOVUxMLCBOVUxMLCAwKTsKfQoKQnV0IHdoYXQgSSBnZXQgaXM6CgplcnJvcjog4oCY
X19OUl9mdXRleOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKICAg
MTIgfCAjZGVmaW5lIFNZU19mdXRleCBfX05SX2Z1dGV4CgoKVGhlIHByb2JsZW0gaXMgdGhhdCBp
ZiBfX05SX2Z1dGV4IGlzIG5vdCBkZWZpbmVkIGl0IHdpbGwgbm90IHdvcmsgYW55d2F5LgoKClNv
IHRoZSBvbmx5IHZpYWJsZSBzb2x1dGlvbiB0byBjb3JyZWN0bHkgY29tcGlsZSBhbmQgdXNlIHBl
cmYgb24gcmlzY3YKMzIgYml0IGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aW1lMzIgc3lzY2Fs
bCBmb3IgdGhhdCBhcmNoaXRlY3R1cmU/CgpBbmQgdGhpcyBpcyB0cnVlIGZvciBhbGwgMzIgYml0
IGFwcGxpY2F0aW9ucyB0aGF0IHdhbnQgdG8gY2FsbCBmdXRleApzeXNjYWxsIHdpdGggYSBub24g
TlVMTCB0aW1lciBwYXJhbWV0ZXIsIHJpZ2h0PwoKCj4gSWYgeW91IGNhbGwgZnV0ZXhfdGltZTY0
LCB5b3UgaGF2ZSB0byBwYXNzIGEgX19rZXJuZWxfdGltZXNwZWMgc3RydWN0dXJlLAo+IHdoaWxl
IHRoZSBvbGQgZnV0ZXggY2FsbCBtdXN0IHRha2UgYSBfX2tlcm5lbF9vbGRfdGltZXNwZWMgc3Ry
dWN0dXJlLgo+IERlcGVuZGluZyBvbiB0aGUgYXJjaGl0ZWN0dXJlLCBvbmx5IG9uZSBvZiB0aGUg
dHdvIHN5c2NhbGxzIG1pZ2h0IGJlCj4gYXZhaWxhYmxlLCBhbmQgaWYgeW91IHBhc3MgYSB0aW1l
c3BlYyBkZWZpbmVkIGJ5IGxpYmMsIHlvdSBoYXZlIHRvCj4ga25vdyB3aGljaCBvZiB0aGUgdHdv
IHN5c2NhbGxzIHRoYXQgY29ycmVzcG9uZHMgdG8sIG9yIGNvbnZlcnQKPiB0aGUgYXJndW1lbnRz
IHdoZW4gY2FsbGluZyBpdC4KPgo+ICAgICAgIEFybmQKClRoYW5rIHlvdSwgYmVzdCByZWdhcmRz
LgoKRW1pbGlhbm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
