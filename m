Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D033C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLqQTFuWlU9zbCjB6PX5A69SEUmButCOhJ3M/9GfUdw=; b=TL60OgiuvkZNFk
	6d63oRWG6eD3FxFyybMRcRhJrUpqdTSVHFk4NA0WcJ4OXSzYNa96VgXrMu9TMLTIfFhSaM2YB1gTR
	pKut3oW1I/Wly3a6Yg8+W7jNW+vZvUPfPpYSromuk2TBAP/3DrmFiknpZFtDeNKTw4WXumXpngtAA
	Piogw81Gn0Z8/mScgOwGgJXNYM8DAtQjJLRFPnzxKBjqdD/DUdn1rl0Cv9A9sBmP0Ld0XT5D8l4PF
	1lTTvfQmNFquEgk2IG2bkRPp70HO2wcMLmMrfxpHTmOoHe26UcfSNK+QOqcFx5tknu6lzkiVVuaIY
	RkOyzwshWDQvPs0roGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11bu-005ofq-0H;
	Thu, 09 Nov 2023 09:46:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11bq-005of9-2n
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 09:46:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso695328b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 01:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699523157; x=1700127957; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbSiGKrBhM2/wHXRoKptmfeSde2mpjPrJRJ8xggR25Y=;
        b=BHXHb0mQB6Z4G5YAVpylFcEfs+P0nCCbRzOVsBMcLLp5Cjut630P2DcnNdFx6oqL5r
         prmxLQ4QeYdGhNHHNixh6aIaTImtVS9oCE7qagL9BchEe1FBfYseaklyLUS1/EFLGfTf
         yaYvzhvCyh6AvJY2VC4YRsNcbGRM2fpm9CBsBbjaxf8sdVmBoXmnkAkxNyR+UHzwN2qt
         gLCrpVZxibwxA4MqK/lMUuLFhhQ9oXTTRx5hQqZWJF7m0CY/QT9TcYR2+tGWAEc74WU1
         pGa/vdXokGY/2CWL2urlovNAbWmcfd67g41MmMsfOxBtDOo7fn2qCiYQecSiDyjzE7yz
         0smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523157; x=1700127957;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbSiGKrBhM2/wHXRoKptmfeSde2mpjPrJRJ8xggR25Y=;
        b=NKuaACkIrY/UCUCjTgQ1jRwJRVYVMsTotaKO1c35jXws0LyftLoAZjautr6L2Wxbh7
         Y4XqcN/p0Hq+RjXZFkH6bQAiV0tvEEeq+BeE8E7/CAI3diADKWJp8RTIU0hNrXXF0S7b
         L7mZV1ljUMw1+2Jv+A4W4VnySnwXcmH7dJaBOUD9H834B8hNMefJedr1wkTITw8bD5+p
         KYodK1+b69N5D/y1lDsJGLD0N45FigJddiFpG+BIk8R+PpcSTM0aarjqkZ25U4yLzkOy
         6ZTBWlXgSM3+oFT9h5ntODzDPMj8Xy+X5eEN7bYegOPRX8Fa8XGUguhCSIuSF2IfRFNK
         m6Cg==
X-Gm-Message-State: AOJu0YwngIuAoOHCmtvzcRd7sHFm+wimyYF3k4vD0xR25by/N0SX9N5W
	gpS3qU7iksXAgdu/UjxqDrg9Og==
X-Google-Smtp-Source: AGHT+IHcxvykfL05iCgUN8NZYoRBP07ZEj+8KS+NLRxGiL6Z6fO5lkId5FnQ6uAbYO6wWgDNI5Gdhg==
X-Received: by 2002:a05:6a20:1594:b0:17a:f0e0:ed07 with SMTP id h20-20020a056a20159400b0017af0e0ed07mr5017358pzj.15.1699523156774;
        Thu, 09 Nov 2023 01:45:56 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:aeef:31cf:49a7:c:20d4? ([2402:7500:4ce:aeef:31cf:49a7:c:20d4])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7874d000000b006c31c0dfb69sm10276439pfo.188.2023.11.09.01.45.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:45:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231109-prevalent-serrated-d40eb5f71236@wendy>
Date: Thu, 9 Nov 2023 17:45:51 +0800
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Message-Id: <F2C4CCA2-0513-4988-94C4-1ECEB9F1D578@sifive.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
 <20231109-revolver-heat-9f4788c51bbf@wendy>
 <20231109-prevalent-serrated-d40eb5f71236@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_014558_990586_884E8CAD 
X-CRM114-Status: GOOD (  15.68  )
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

T24gTm92IDksIDIwMjMsIGF0IDE1OjU0LCBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPiB3cm90ZToKPiBPbiBUaHUsIE5vdiAwOSwgMjAyMyBhdCAwNzo0NDo0NkFNICsw
MDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIFRodSwgTm92IDA5LCAyMDIzIGF0IDEwOjU4
OjQxQU0gKzA4MDAsIEplcnJ5IFNoaWggd3JvdGU6Cj4+PiBPbiBOb3YgNywgMjAyMywgYXQgMTg6
NTUsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+PiBUaGUg
WnZrbmhhIGFuZCBadmtuaGIgYXJlIGV4Y2x1c2l2ZS4gSXQncyBub3QgdGhlIHN1cGVyc2V0IHJl
bGF0aW9uc2hpcC4KPj4+IAo+Pj4gUGxlYXNlIGNoZWNrOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LWNyeXB0by9pc3N1ZXMvMzY0I2lzc3VlY29tbWVudC0xNzI2NzgyMDk2Cj4+
IAo+PiBZb3UgZ290IGEgcmVzcG9uc2UgdG8gdGhpcyBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwg
YnV0IGRpZG4ndCBlbmdhZ2UKPj4gd2l0aCBpdDoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL2M2NGQ5ZGRiLWVkYmQtNGM4Zi1iNTZmLTFiOTBkODIxMDBiN0ByaXZvc2luYy5jb20vI3QK
ClJlcGx5IGZvciB0aGUgdGhyZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYzY0ZDlk
ZGItZWRiZC00YzhmLWI1NmYtMWI5MGQ4MjEwMGI3QHJpdm9zaW5jLmNvbS8jdAoKPiBZZXMsIGJ1
dCBmb3IgaW5zdGFuY2UsIHdoYXQgaGFwcGVucyBpZiB0aGUgdXNlciBxdWVyeSB0aGUgenZrbmhh
IChpZiBpdAo+IG9ubHkgbmVlZHMgU0hBMjU2KSBidXQgenZrbmhiIGlzIHByZXNlbnQuIElmIHdl
IGRvbid0IGRlY2xhcmUgenZrbmhhLAo+IHRoZW4gaXQgd2lsbCBmYWlsIGJ1dCB0aGUgc3VwcG9y
dCB3b3VsZCBhY3R1YWxseSBiZSBwcmVzZW50IGR1ZSB0bwo+IHp2a25oYiBiZWluZyB0aGVyZS4K
CklmIHdlIG5lZWRzIFNIQTI1NiBvbmx5LCB0aGVuIHdlIHNob3VsZCBjaGVjayB3aGV0aGVyIHdl
IGhhdmUgenZrbmhhIGBvcmAgenZrbmhiLgpodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVu
c3NsL2Jsb2IvNGQ0NjU3Y2I2YmEzNjRkZmE2MDY4MTk0OGIwYTMwYzQwYmVlMzFjYS9jcnlwdG8v
c2hhL3NoYV9yaXNjdi5jI0wyNAoKPiBBaGgsIEkgbm93IHNlZSB3aGF0IHRoYXQgaGFwcGVuZWQu
IFlvdXIgbWFpbGVyIGlzIGJyb2tlbiBhbmQgcHV0cyB0aGUKPiBtZXNzYWdlLWlkIG9mIHdoYXQg
eW91IGFyZSByZXBseWluZyB0byBpbiB0aGUgSW4tUmVwbHktVG8gYW5kIFJlcGx5LVRvCj4gaGVh
ZGVycy4gVGhlIGZvcm1lciBpcyBjb3JyZWN0LCB0aGUgbGF0dGVyIGlzIGJvZ3VzICYgbWVhbnMg
eW91IGRvbid0IGV2ZW4KPiBnZXQgZGVsaXZlcmVkIHRoZSByZXNwb25zZS4KCkkgdXNlIG1hYyBi
dWlsdGluIGBtYWlsYCBjbGllbnQuIEFuZCBJIHRoaW5rIEkgcHV0IHRoZSBgaW4tcmVwbHktdG9g
IGFkZHJlc3MgdG8KdGhlIGByZXBseSB0b2AgZmllbGQuIEhvcGUgdGhpcyBvbmUgd29ya3Mgd2Vs
bC4gVGhhbmsgeW91IGZvciB0aGUgdGhyZWFkIGZvcndhcmRpbmcuCgotSmVycnkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
