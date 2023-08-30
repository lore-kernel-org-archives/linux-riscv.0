Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9F1C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xwsHA9FR6yPyNcB2k2CcpUPMGobEPfjtfQE6+Yq6mSc=; b=z/P21JwvMv7LTPfCqbsJ0euCm/
	0WB0zszWtqtfLp0bL+CK9jjHJszPVyi5MoTrkuVmf67w3ilvoMUrebABBaPPU+K+BNRU56ASNmybU
	2MGKDkhWtDXSYZ6108lgIKHu/8fVdl6+Il5NB0dNlZZpBUHZNo44yqGBNDkAi1aPFVs/u38Ate83Y
	7U6TgFTLqIZPIygmzWPi0Iu3zIYYampWLfpaqNeqiQ5ywB9HfsAUMaZ+gwfVsDrVEtRHeV8lViEQQ
	jF9yQMW9pR6OmkF6sxmKDP8aaa8XWAncrJBWBbjdtYWRg+6bIdHd5PM2Ot37Vz9dyuCXd9RIEhrRc
	rJ87kdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbS2Y-00E9cZ-2g;
	Wed, 30 Aug 2023 20:43:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbS2V-00E9Za-1P
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:43:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68c3ec0578bso67003b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1693428221; x=1694033021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMBkhczQH1qmGcrJTMkEc78ZsB3x427DIZD5leKmdCs=;
        b=oLCc4YeiQCbJwKmsfvDOvoLW1vxh+z3z7NiwmoD2cNO8j+uoEHzpBEDqwygNyfB2bk
         VqN1q9wgSCh0VQ1TKyKtXXGd1I30BdSkfV9eq8VbxwnsSKrB0+ea17ab8FnXo7c2t8dR
         6bfx2wr9tNf0NgPo5VgEjzfXThsGDOcYhZ2oEFM6nI/Rw3s6hIXBTwd3BtZG/iNVWMPj
         xzWbCZBJcf9g+8TehdWzonZrnxewoAr1dyE/GTideci2lzcbH7qhm06yIbG4s1KDIp9F
         4nLu6HqjVOb4sBjFAFSWoSX8CB3FGtNFz/wpRORu9mJnE5S/Ds2RCFeMJqMwcSFgQzZO
         RDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693428221; x=1694033021;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMBkhczQH1qmGcrJTMkEc78ZsB3x427DIZD5leKmdCs=;
        b=UK9q77oj+cmc6liOjpDXG3klG93PmEMfjuZ6gsxA96PnweH3Sp8oIc9PLxlquJUU9C
         2bmzb3DoGDWzChMjp9+ocXsh/kWN7J/hyrtG5rWT0NX+3sFEGon/k3h5VOBVDPg9hKFw
         JxbMcv7Nu0EIIR1kEVpvCMibMkRkWPXjYd78jHymael/OfI9tUQ/sLo5mi8c4uC5pmh6
         ZXyBEbDQwiCLkdlkhjy6SZ9fq7F3COj+J679UEZEjy7GV+a/LCZ3Kz2bKLfONJyoolI8
         oTb8be4yQkgiUr859CzsKPrvsmEKfBJhyM8t4h3iw7pnkE/LYT0tgsQYpv2h6QfGxSSP
         GvXQ==
X-Gm-Message-State: AOJu0YycUhQHdUnv7sX6nWiTo3XI/OtCPyKbmqnRCXL9NlrCx/9kAMRr
	0zSu+YlCI7FrjT/57bAlm4mm8g==
X-Google-Smtp-Source: AGHT+IEXJX5INKmx+JVIrSQXkkSDnbAq3tdEyiKPwQyI3es3qg1UtsgXXDAUGGMz8iwGEvAWuKz1kg==
X-Received: by 2002:a05:6a20:5498:b0:14c:c9f6:d657 with SMTP id i24-20020a056a20549800b0014cc9f6d657mr3916796pzk.22.1693428221194;
        Wed, 30 Aug 2023 13:43:41 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q10-20020a17090311ca00b001bdcc3a09c3sm11466390plh.256.2023.08.30.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 13:43:40 -0700 (PDT)
Date: Wed, 30 Aug 2023 13:43:40 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Aug 2023 13:43:37 PDT (-0700)
Subject: Re: [PATCH bpf-next v3 0/3] bpf, riscv: use BPF prog pack allocator in BPF JIT
In-Reply-To: <87fs40k4we.fsf@all.your.base.are.belong.to.us>
CC: daniel@iogearbox.net, puranjay12@gmail.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, pulehui@huawei.com,
  Conor Dooley <conor.dooley@microchip.com>, ast@kernel.org, andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
  yhs@fb.com, kpsingh@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org
Message-ID: <mhng-fc3daeee-958b-4851-85e4-b949a2419d57@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_134347_474240_83E8A35C 
X-CRM114-Status: GOOD (  23.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAzMCBBdWcgMjAyMyAwNjo1OToxMyBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PiB3cml0ZXM6
Cj4KPj4gT24gOC8yOS8yMyAxMjowNiBQTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4+IFB1cmFu
amF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4gd3JpdGVzOgo+Pj4gCj4+Pj4gQ2hhbmdl
cyBpbiB2MiAtPiB2MzoKPj4+PiAxLiBGaXggbWF4aW11bSB3aWR0aCBvZiBjb2RlIGluIHBhdGNo
ZXMgZnJvbSA4MCB0byAxMDAuIFtBbGwgcGF0Y2hlc10KPj4+PiAyLiBBZGQgY2hlY2tzIGZvciBj
dHgtPnJvX2luc25zID09IE5VTEwuIFtQYXRjaCAzXQo+Pj4+IDMuIEZpeCBjaGVjayBmb3IgZWRn
ZSBjb25kaXRpb24gd2hlcmUgYW1vdW50IG9mIHRleHQgdG8gc2V0ID4gMiAqIHBhZ2VzaXplCj4+
Pj4gICAgIFtQYXRjaCAxIGFuZCAyXQo+Pj4+IDQuIEFkZCByZXZpZXdlZC1ieSBpbiBwYXRjaGVz
Lgo+Pj4+IDUuIEFkZGluZyByZXN1bHRzIG9mIHNlbGZ0ZXN0IGhlcmU6Cj4+Pj4gICAgIFVzaW5n
IHRoZSBjb21tYW5kOiAuL3Rlc3RfcHJvZ3Mgb24gcWVtdQo+Pj4+ICAgICBXaXRob3V0IHRoZSBz
ZXJpZXM6IFN1bW1hcnk6IDMzNi8zMTYyIFBBU1NFRCwgNTYgU0tJUFBFRCwgOTAgRkFJTEVECj4+
Pj4gICAgIFdpdGggdGhpcyBzZXJpZXM6IFN1bW1hcnk6IDMzNi8zMTYyIFBBU1NFRCwgNTYgU0tJ
UFBFRCwgOTAgRkFJTEVECj4+Pj4KPj4+PiBDaGFuZ2VzIGluIHYxIC0+IHYyOgo+Pj4+IDEuIElt
cGxlbWVudCBhIG5ldyBmdW5jdGlvbiBwYXRjaF90ZXh0X3NldF9ub3N5bmMoKSB0byBiZSB1c2Vk
IGluIGJwZl9hcmNoX3RleHRfaW52YWxpZGF0ZSgpLgo+Pj4+ICAgICBUaGUgaW1wbGVtZW50YXRp
b24gaW4gdjEgY2FsbGVkIHBhdGNoX3RleHRfbm9zeW5jKCkgaW4gYSBsb29wIGFuZCBpdCB3YXMg
YmFkIGFzIGl0IHdvdWxkCj4+Pj4gICAgIGNhbGwgZmx1c2hfaWNhY2hlX3JhbmdlKCkgZm9yIGV2
ZXJ5IHdvcmQgbWFraW5nIGl0IHJlYWxseSBzbG93LiBUaGlzIHdhcyBmb3VuZCBieSBydW5uaW5n
Cj4+Pj4gICAgIHRoZSB0ZXN0X3RhZyBzZWxmdGVzdCB3aGljaCB3b3VsZCB0YWtlIGZvcmV2ZXIg
dG8gY29tcGxldGUuCj4+Pj4KPj4+PiBIZXJlIGlzIHNvbWUgZGF0YSB0byBwcm92ZSB0aGUgVjIg
Zml4ZXMgdGhlIHByb2JsZW06Cj4+Pj4KPj4+PiBXaXRob3V0IHRoaXMgc2VyaWVzOgo+Pj4+IHJv
b3RAcnYtc2VsZnRlc3Rlcjp+L3NyYy9rc2VsZnRlc3QvYnBmIyB0aW1lIC4vdGVzdF90YWcKPj4+
PiB0ZXN0X3RhZzogT0sgKDQwOTQ1IHRlc3RzKQo+Pj4+Cj4+Pj4gcmVhbCAgICA3bTQ3LjU2MnMK
Pj4+PiB1c2VyICAgIDBtMjQuMTQ1cwo+Pj4+IHN5cyAgICAgNm0zNy4wNjRzCj4+Pj4KPj4+PiBX
aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQ6Cj4+Pj4gcm9vdEBydi1zZWxmdGVzdGVyOn4vc3JjL3Nl
bGZ0ZXN0L2JwZiMgdGltZSAuL3Rlc3RfdGFnCj4+Pj4gdGVzdF90YWc6IE9LICg0MDk0NSB0ZXN0
cykKPj4+Pgo+Pj4+IHJlYWwgICAgN20yOS40NzJzCj4+Pj4gdXNlciAgICAwbTI1Ljg2NXMKPj4+
PiBzeXMgICAgIDZtMTguNDAxcwo+Pj4+Cj4+Pj4gQlBGIHByb2dyYW1zIGN1cnJlbnRseSBjb25z
dW1lIGEgcGFnZSBlYWNoIG9uIFJJU0NWLiBGb3Igc3lzdGVtcyB3aXRoIG1hbnkgQlBGCj4+Pj4g
cHJvZ3JhbXMsIHRoaXMgYWRkcyBzaWduaWZpY2FudCBwcmVzc3VyZSB0byBpbnN0cnVjdGlvbiBU
TEIuIEhpZ2ggaVRMQiBwcmVzc3VyZQo+Pj4+IHVzdWFsbHkgY2F1c2VzIHNsb3cgZG93biBmb3Ig
dGhlIHdob2xlIHN5c3RlbS4KPj4+Pgo+Pj4+IFNvbmcgTGl1IGludHJvZHVjZWQgdGhlIEJQRiBw
cm9nIHBhY2sgYWxsb2NhdG9yWzFdIHRvIG1pdGlnYXRlIHRoZSBhYm92ZSBpc3N1ZS4KPj4+PiBJ
dCBwYWNrcyBtdWx0aXBsZSBCUEYgcHJvZ3JhbXMgaW50byBhIHNpbmdsZSBodWdlIHBhZ2UuIEl0
IGlzIGN1cnJlbnRseSBvbmx5Cj4+Pj4gZW5hYmxlZCBmb3IgdGhlIHg4Nl82NCBCUEYgSklULgo+
Pj4+Cj4+Pj4gSSBlbmFibGVkIHRoaXMgYWxsb2NhdG9yIG9uIHRoZSBBUk02NCBCUEYgSklUWzJd
LiBJdCBpcyBiZWluZyByZXZpZXdlZCBub3cuCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIHNlcmllcyBl
bmFibGVzIHRoZSBCUEYgcHJvZyBwYWNrIGFsbG9jYXRvciBmb3IgdGhlIFJJU0NWIEJQRiBKSVQu
Cj4+Pj4gVGhpcyBzZXJpZXMgbmVlZHMgYSBwYXRjaFszXSBmcm9tIHRoZSBBUk02NCBzZXJpZXMg
dG8gd29yay4KPj4+Pgo+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+Pj4+IFBlcmZvcm1hbmNlIEFuYWx5c2lzIG9mIHByb2cgcGFjayBh
bGxvY2F0b3Igb24gUklTQ1Y2NAo+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+Pj4+Cj4+Pj4gVGVzdCBzZXR1cDoKPj4+PiA9PT09PT09
PT09PQo+Pj4+Cj4+Pj4gSG9zdCBtYWNoaW5lOiBEZWJpYW4gR05VL0xpbnV4IDExIChidWxsc2V5
ZSkKPj4+PiBRZW11IFZlcnNpb246IFFFTVUgZW11bGF0b3IgdmVyc2lvbiA4LjAuMyAoRGViaWFu
IDE6OC4wLjMrZGZzZy0xKQo+Pj4+IHUtYm9vdC1xZW11IFZlcnNpb246IDIwMjMuMDcrZGZzZy0x
Cj4+Pj4gb3BlbnNiaSBWZXJzaW9uOiAxLjMtMQo+Pj4+Cj4+Pj4gVG8gdGVzdCB0aGUgcGVyZm9y
bWFuY2Ugb2YgdGhlIEJQRiBwcm9nIHBhY2sgYWxsb2NhdG9yIG9uIFJWLCBhIHN0cmVzc2VyCj4+
Pj4gdG9vbFs0XSBsaW5rZWQgYmVsb3cgd2FzIGJ1aWx0LiBUaGlzIHRvb2wgbG9hZHMgOCBCUEYg
cHJvZ3JhbXMgb24gdGhlIHN5c3RlbSBhbmQKPj4+PiB0cmlnZ2VycyA1IG9mIHRoZW0gaW4gYW4g
aW5maW5pdGUgbG9vcCBieSBkb2luZyBzeXN0ZW0gY2FsbHMuCj4+Pj4KPj4+PiBUaGUgcnVubmVy
IHNjcmlwdCBzdGFydHMgMjAgaW5zdGFuY2VzIG9mIHRoZSBhYm92ZSB3aGljaCBsb2FkcyA4KjIw
PTE2MCBCUEYKPj4+PiBwcm9ncmFtcyBvbiB0aGUgc3lzdGVtLCA1KjIwPTEwMCBvZiB3aGljaCBh
cmUgYmVpbmcgY29uc3RhbnRseSB0cmlnZ2VyZWQuCj4+Pj4gVGhlIHNjcmlwdCBpcyBwYXNzZWQg
YSBjb21tYW5kIHdoaWNoIHdvdWxkIGJlIHJ1biBpbiB0aGUgYWJvdmUgZW52aXJvbm1lbnQuCj4+
Pj4KPj4+PiBUaGUgc2NyaXB0IHdhcyBydW4gd2l0aCBmb2xsb3dpbmcgcGVyZiBjb21tYW5kOgo+
Pj4+IC4vcnVuLnNoICJwZXJmIHN0YXQgLWEgXAo+Pj4+ICAgICAgICAgIC1lIGlUTEItbG9hZC1t
aXNzZXMgXAo+Pj4+ICAgICAgICAgIC1lIGRUTEItbG9hZC1taXNzZXMgIFwKPj4+PiAgICAgICAg
ICAtZSBkVExCLXN0b3JlLW1pc3NlcyBcCj4+Pj4gICAgICAgICAgLWUgaW5zdHJ1Y3Rpb25zIFwK
Pj4+PiAgICAgICAgICAtLXRpbWVvdXQgNjAwMDAiCj4+Pj4KPj4+PiBUaGUgb3V0cHV0IG9mIHRo
ZSBhYm92ZSBjb21tYW5kIGlzIGRpc2N1c3NlZCBiZWxvdyBiZWZvcmUgYW5kIGFmdGVyIGVuYWJs
aW5nIHRoZQo+Pj4+IEJQRiBwcm9nIHBhY2sgYWxsb2NhdG9yLgo+Pj4+Cj4+Pj4gVGhlIHRlc3Rz
IHdlcmUgcnVuIG9uIHFlbXUtc3lzdGVtLXJpc2N2NjQgd2l0aCA4IGNwdXMsIDE2RyBtZW1vcnku
IFRoZSByb290ZnMKPj4+PiB3YXMgY3JlYXRlZCB1c2luZyBCam9ybidzIHJpc2N2LWNyb3NzLWJ1
aWxkZXJbNV0gZG9ja2VyIGNvbnRhaW5lciBsaW5rZWQgYmVsb3cuCj4+Pj4KPj4+PiBSZXN1bHRz
Cj4+Pj4gPT09PT09PQo+Pj4+Cj4+Pj4gQmVmb3JlIGVuYWJsaW5nIHByb2cgcGFjayBhbGxvY2F0
b3I6Cj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4KPj4+PiBQ
ZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdpZGUnOgo+Pj4+Cj4+Pj4gICAg
ICAgICAgICAgNDkzOTA0OCAgICAgIGlUTEItbG9hZC1taXNzZXMKPj4+PiAgICAgICAgICAgICA1
NDY4Njg5ICAgICAgZFRMQi1sb2FkLW1pc3Nlcwo+Pj4+ICAgICAgICAgICAgICA0NjUyMzQgICAg
ICBkVExCLXN0b3JlLW1pc3Nlcwo+Pj4+ICAgICAgIDE0NDEwODIwOTc5OTggICAgICBpbnN0cnVj
dGlvbnMKPj4+Pgo+Pj4+ICAgICAgICA2MC4wNDU3OTEyMDAgc2Vjb25kcyB0aW1lIGVsYXBzZWQK
Pj4+Pgo+Pj4+IEFmdGVyIGVuYWJsaW5nIHByb2cgcGFjayBhbGxvY2F0b3I6Cj4+Pj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pgo+Pj4+IFBlcmZvcm1hbmNlIGNvdW50
ZXIgc3RhdHMgZm9yICdzeXN0ZW0gd2lkZSc6Cj4+Pj4KPj4+PiAgICAgICAgICAgICAzNDMwMDM1
ICAgICAgaVRMQi1sb2FkLW1pc3Nlcwo+Pj4+ICAgICAgICAgICAgIDUwMDg3NDUgICAgICBkVExC
LWxvYWQtbWlzc2VzCj4+Pj4gICAgICAgICAgICAgIDQwOTk0NCAgICAgIGRUTEItc3RvcmUtbWlz
c2VzCj4+Pj4gICAgICAgMTQ0MTUzNTYzNzk4OCAgICAgIGluc3RydWN0aW9ucwo+Pj4+Cj4+Pj4g
ICAgICAgIDYwLjA0NjI5NjYwMCBzZWNvbmRzIHRpbWUgZWxhcHNlZAo+Pj4+Cj4+Pj4gSW1wcm92
ZW1lbnRzIGluIG1ldHJpY3MKPj4+PiA9PT09PT09PT09PT09PT09PT09PT09PQo+Pj4+Cj4+Pj4g
SXQgd2FzIGV4cGVjdGVkIHRoYXQgdGhlIGlUTEItbG9hZC1taXNzZXMgd291bGQgZGVjcmVhc2Ug
YXMgbm93IGEgc2luZ2xlIGh1Z2UKPj4+PiBwYWdlIGlzIHVzZWQgdG8ga2VlcCBhbGwgdGhlIEJQ
RiBwcm9ncmFtcyBjb21wYXJlZCB0byBhIHNpbmdsZSBwYWdlIGZvciBlYWNoCj4+Pj4gcHJvZ3Jh
bSBlYXJsaWVyLgo+Pj4+Cj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4+PiBUaGUgaW1wcm92ZW1lbnQgaW4gaVRMQi1sb2FkLW1pc3NlczogLTMwLjUg
JQo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4K
Pj4+PiBJIHJlcGVhdGVkIHRoaXMgZXhwcmltZW50IG1vcmUgdGhhbiAxMDAgdGltZXMgaW4gZGlm
ZmVyZW50IHNldHVwcyBhbmQgdGhlCj4+Pj4gaW1wcm92ZW1lbnQgd2FzIGFsd2F5cyBncmVhdGVy
IHRoYW4gMzAlLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYm9vdCB0ZXN0ZWQgb24g
dGhlIFN0YXJmaXZlIFZpc2lvbkZpdmUgMiBib2FyZFs2XS4KPj4+PiBUaGUgcGVyZm9ybWFuY2Ug
YW5hbHlzaXMgd2FzIG5vdCBkb25lIG9uIHRoZSBib2FyZCBiZWNhdXNlIGl0IGRvZXNuJ3QKPj4+
PiBleHBvc2UgaVRMQi1sb2FkLW1pc3NlcywgZXRjLiBUaGUgc3RyZXNzZXIgcHJvZ3JhbSB3YXMg
cnVuIG9uIHRoZSBib2FyZCB0byB0ZXN0Cj4+Pj4gdGhlIGxvYWRpbmcgYW5kIHVubG9hZGluZyBv
ZiBCUEYgcHJvZ3JhbXMKPj4+Pgo+Pj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYv
MjAyMjAyMDQxODU3NDIuMjcxMDMwLTEtc29uZ0BrZXJuZWwub3JnLwo+Pj4+IFsyXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA2MjYwODU4MTEuMzE5MjQwMi0xLXB1cmFuamF5MTJA
Z21haWwuY29tLwo+Pj4+IFszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA2MjYw
ODU4MTEuMzE5MjQwMi0yLXB1cmFuamF5MTJAZ21haWwuY29tLwo+Pj4+IFs0XSBodHRwczovL2dp
dGh1Yi5jb20vcHVyYW5qYXltb2hhbi9CUEYtQWxsb2NhdG9yLUJlbmNoCj4+Pj4gWzVdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9iam90by9yaXNjdi1jcm9zcy1idWlsZGVyCj4+Pj4gWzZdIGh0dHBzOi8v
d3d3LnN0YXJmaXZldGVjaC5jb20vZW4vc2l0ZS9ib2FyZHMKPj4+Pgo+Pj4+IFB1cmFuamF5IE1v
aGFuICgzKToKPj4+PiAgICByaXNjdjogZXh0ZW5kIHBhdGNoX3RleHRfbm9zeW5jKCkgZm9yIG11
bHRpcGxlIHBhZ2VzCj4+Pj4gICAgcmlzY3Y6IGltcGxlbWVudCBhIG1lbXNldCBsaWtlIGZ1bmN0
aW9uIGZvciB0ZXh0Cj4+Pj4gICAgYnBmLCByaXNjdjogdXNlIHByb2cgcGFjayBhbGxvY2F0b3Ig
aW4gdGhlIEJQRiBKSVQKPj4+IAo+Pj4gVGhhbmsgeW91ISBGb3IgdGhlIHNlcmllczoKPj4+IAo+
Pj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4+PiBUZXN0ZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4+IAo+Pj4gQEFsZXhlaSBA
RGFuaWVsIFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gYSBjb3JlIEJQRiBwYXRjaCBmcm9tIHRoZSBB
cm0KPj4+ICAgICAgICAgICAgICAgICAgc2VyaWVzIFszXS4KPgo+IFtzbmlwXQo+PiBJZiBub3Qg
eWV0LCBwZXJoYXBzIHlvdSBjb3VsZCBzaGlwIHRoaXMgc2VyaWVzIGFsb25nIHdpdGggeW91ciBQ
UiB0byBMaW51cwo+PiBkdXJpbmcgdGhpcyBtZXJnZSB3aW5kb3cgZ2l2ZW4gdGhlIGJpZyBuZXQg
UFIgKGluY2wuIGJwZikgd2FzIGFscmVhZHkgbWVyZ2VkCj4+IHllc3RlcmRheS4gU28gZnJvbSBv
dXIgc2lkZSBvbmx5IGZpeGVzIHNoaXAgdG8gTGludXMuCj4KPiBBcmUgeW91IE9LIHdpdGggdGhp
cyBwYXRjaCBnb2luZyB0aHJ1IHRoZSByaXNjdiB0cmVlIGFzIHdlbGw/CgpJJ20gZ2VuZXJhbGx5
IGZpbmUgdGFraW5nIGFsbW9zdCBhbnl0aGluZywgYXMgbG9uZyBhcyB3aG9tZXZlciB1c3VhbGx5
IAp0YWtlcyB0aGVtIGFja3MgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
