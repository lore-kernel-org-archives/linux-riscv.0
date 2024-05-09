Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78356C25B4F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXOGEByl9mxhkcXxGajWYNhsItXSNK9r9M36P+Ir24k=; b=BIbXH7B98P889+
	FKDy+QNxydH6X78789F4916F51vk30uPB/XIgfrbwDVVKGCG2gh/8hcvu/nk0lsjozRhPqgSdl652
	PYeMDRMlP6U0xvEjcx2TPrDWkcuriAazmttKAtZSm2SOhbg1U20Mhv97nlqLziQghVvFzQHAJ5TA3
	p3COYu+lRx6FhNWMPnxP4nVKTfSBUYFXdfZF7bxcBpg+FOgTOLLekp8wG1D9vMjPgAp6Mr9I7lpV/
	08yR++G+tr5eULW4yPysfYcaTCYohWcwiUiF0/5+7dptCwDbxDnujtTJep1GC76JK85OCQbiSQgMy
	NZfgfVjIeFwhV5iLMHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rK6-0000000HMBB-3oa0;
	Thu, 09 May 2024 00:07:46 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rK2-0000000HM8V-1fOq
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 00:07:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f450f43971so350801b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715213255; x=1715818055; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6412VEZicQnkZugSEnbJnR1wa1jdzb6p/Jx7cOdB8xk=;
        b=zZ2F4+mJJSRjtfxL5Nt48jgfd98V+FgbS+zhdSRkfJu7A3af//IohY0jIZG44NMvKA
         jxI/IphKFChj1C/7hJKaQAM25BxW9yQrJXrPyQaP91fUl5OjcoQH8yUdvneaZGsOaTRU
         PrlSsvVD3g9lmwdaGnX8qjn/qR9FyHu7Tkqg111/n8swwJUggr9j+ECG3b5PeaEABgzd
         F+dKheR3UCx1buLwqb+WaRtVkZpAZYiCbFt70O3w7hBWO60EY0ohSMdaydZvDznD7t6/
         nvEubad5sCR5tX+Hhwcd4Tbdh/+qD0hmrE4EMC+yHmPAA3LLL6XaG5250uCmHnowY01k
         fgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715213255; x=1715818055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6412VEZicQnkZugSEnbJnR1wa1jdzb6p/Jx7cOdB8xk=;
        b=FaFArT/wpvLhsJlP06CCosHbRMVMXLVYfk6Sqf2WB66CkRTd/43kBk+ky/m9MejuHy
         HQW8BA1z46x+kuPUPwnf9FHh/aSpfq0RU/j/spVNc4RO40ltiipXLaV5GB2rHjS5Ajzz
         R9oFqtqxbAmV94k5kn9D0CHQm6wCDyfa50RlSXF2DoYHmSd1r9LXk/wcb6cC3kZE7A8Y
         9hRAIGRBYvmX3nJOq7d03E1yEv6DVnNHxut1RhapM3Dl75pMbwI+o2/u2oUIXDhtLho9
         cTObhzZqXCIlxWzlD2ksGIN9QiTdBN0hPVyb/C24+oZHzEqt+SYPWFAXd5is7msMfQeD
         341w==
X-Forwarded-Encrypted: i=1; AJvYcCWPrXidm3b0mnyZH17KSWHm5iu3HFO4GjqGrHl1nM18nlTmgQh5+0+PSxpJAE0NNL5ew638IPyWGUIQJQCTK2NgVbEy8bIq8TlpwI6hoEtt
X-Gm-Message-State: AOJu0YymZ5+mnDy4aw3Rnb2M3iqzfYMe3BQjldaU5RHB2Hih0gwAS6cF
	7ZlTLxZXss4nwCaUMBRG9LCUjhCaK0NHz9dhXxiOUW/NBFkhe0vYWBT6XWirppo=
X-Google-Smtp-Source: AGHT+IFn88bAR8FRppjVpxx4Li1DASVwJ1zF7Yvk7MQzB0h8bmxFN5sOCIHGIBoohUfrAWiBfqn16Q==
X-Received: by 2002:aa7:8b11:0:b0:6f0:be31:8577 with SMTP id d2e1a72fcca58-6f49c280ad8mr4602857b3a.22.1715213255357;
        Wed, 08 May 2024 17:07:35 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4144:6911:574f:fec1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2fe07sm137325b3a.216.2024.05.08.17.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 17:07:34 -0700 (PDT)
Date: Wed, 8 May 2024 17:07:30 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, jerry.shih@sifive.com,
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 05/29] riscv: zicfiss / zicfilp enumeration
Message-ID: <ZjwTwvaYSFAuB1qr@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-6-debug@rivosinc.com>
 <CABgGipX3vXeJ_RKnV17pE-NH6=L0XUF2sdKea7hZHbuq4skh_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipX3vXeJ_RKnV17pE-NH6=L0XUF2sdKea7hZHbuq4skh_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_170742_592720_57F400E3 
X-CRM114-Status: GOOD (  25.50  )
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

T24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMDg6MDA6MDBBTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IEhpIERlZXBhaywKPiAKPiBPbiBUaHUsIEFwciA0LCAyMDI0IGF0IDc6NDHigK9BTSBEZWVw
YWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBwYXRjaCBh
ZGRzIHN1cHBvcnQgZm9yIGRldGVjdGluZyB6aWNmaXNzIGFuZCB6aWNmaWxwLiB6aWNmaXNzIGFu
ZAo+ID4gemljZmlscCBzdGFuZHMgZm9yIHVucHJpdmxlZ2VkIGludGVnZXIgc3BlYyBleHRlbnNp
b24gZm9yIHNoYWRvdyBzdGFjawo+ID4gYW5kIGJyYW5jaCB0cmFja2luZyBvbiBpbmRpcmVjdCBi
cmFuY2hlcywgcmVzcGVjdGl2ZWx5Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggbG9va3MgZm9yIHppY2Zp
c3MgYW5kIHppY2ZpbHAgaW4gZGV2aWNlIHRyZWUgYW5kIGFjY29yZGlubGd5Cj4gPiBsaWdodHMg
dXAgYml0IGluIGNwdSBmZWF0dXJlIGJpdG1hcC4gRnVydGhlcm1vcmUgdGhpcyBwYXRjaCBhZGRz
IGRldGVjdGlvbgo+ID4gdXRpbGl0eSBmdW5jdGlvbnMgdG8gcmV0dXJuIHdoZXRoZXIgc2hhZG93
IHN0YWNrIG9yIGxhbmRpbmcgcGFkcyBhcmUKPiA+IHN1cHBvcnRlZCBieSBjcHUuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCB8IDEzICsrKysrKysrKysr
KysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICB8ICAyICsrCj4gPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgfCAgMSArCj4gPiAgYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgfCAgMiArKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4g
PiBpbmRleCAwYmQxMTg2MmI3NjAuLmYwZmI4ZDhhZTI3MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ID4gQEAgLTgsNiArOCw3IEBACj4gPgo+ID4gICNpbmNsdWRl
IDxsaW51eC9iaXRtYXAuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPiAg
I2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2Vy
cm5vLmg+Cj4gPiBAQCAtMTM3LDQgKzEzOCwxNiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJv
b2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoaW50IGNwdSwgY29uc3QgdW5zaQo+
ID4KPiA+ICBERUNMQVJFX1NUQVRJQ19LRVlfRkFMU0UoZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19z
cGVlZF9rZXkpOwo+ID4KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgY3B1X3N1cHBvcnRzX3NoYWRv
d19zdGFjayh2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJuIChJU19FTkFCTEVEKENPTkZJ
R19SSVNDVl9VU0VSX0NGSSkgJiYKPiA+ICsgICAgICAgICAgICAgICAgICAgcmlzY3ZfY3B1X2hh
c19leHRlbnNpb25fdW5saWtlbHkoc21wX3Byb2Nlc3Nvcl9pZCgpLCBSSVNDVl9JU0FfRVhUX1pJ
Q0ZJU1MpKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSBib29sIGNwdV9zdXBwb3J0
c19pbmRpcmVjdF9icl9scF9pbnN0cih2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJuIChJ
U19FTkFCTEVEKENPTkZJR19SSVNDVl9VU0VSX0NGSSkgJiYKPiA+ICsgICAgICAgICAgICAgICAg
ICAgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoc21wX3Byb2Nlc3Nvcl9pZCgpLCBS
SVNDVl9JU0FfRVhUX1pJQ0ZJTFApKTsKPiA+ICt9Cj4gPiArCj4gPiAgI2VuZGlmCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oCj4gPiBpbmRleCAxZjJkMjU5OWM2NTUuLjc0YjZjNzI3ZjU0NSAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBAQCAtODAsNiArODAsOCBAQAo+ID4gICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEgICAgICAgICAgICAgIDcxCj4gPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pUU08gICAgICAgICAgICAgNzIKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WkFDQVMgICAgICAgICAgICA3Mwo+IG5pdDogdHdvIHRhYnMgZm9yIGFsaWdubWVudAo+IAoKRGVl
cGFrLCBJIHRoaW5rIHlvdSBtaWdodCBiZSB1c2luZyB0YWJzIHdpdGggYSBkaXNwbGF5IHNpemUg
b2YgNCBzcGFjZXMKdGhhdCBjYXVzZXMgYSBjb3VwbGUgb2YgcGxhY2VzIHRvIGhhdmUgaW5jb3Jy
ZWN0IGFsaWdubWVudCBidXQgd291bGQKbG9vayBjb3JyZWN0IHdpdGggNCBzcGFjZXMuIExpbnV4
IHVzZXMgOCBzcGFjZXMgZm9yIHRhYnMuCgotIENoYXJsaWUKCj4gCj4gPiArI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pJQ0ZJTFAgIDc0Cj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1Mg
IDc1Cj4gPgo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcgICAgIDEyNwo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gaW5kZXggYTg1MDljYzMxYWIy
Li42YzViM2Q5MjhiMTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4g
PiBAQCAtMTMsNiArMTMsNyBAQAo+ID4gICNpbmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgo+ID4K
PiA+ICAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgo+ID4gKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4K
PiA+Cj4gPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ID4gICNkZWZpbmUgREVGQVVMVF9NQVBfV0lO
RE9XICAgICAoVUwoMSkgPDwgKE1NQVBfVkFfQklUUyAtIDEpKQo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYwo+ID4gaW5kZXggNzlhNWEzNWZhYjk2Li5kMDUyY2FkNWI4MmYgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+ID4gQEAgLTI2Myw2ICsyNjMsOCBAQCBjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiA+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEEoaCwgUklTQ1ZfSVNBX0VYVF9oKSwKPiA+ICAgICAgICAgX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUKHppY2JvbSwgUklTQ1ZfSVNBX0VYVF9aSUNCT00sIHJpc2N2X3hsaW51eGVu
dmNmZ19leHRzKSwKPiA+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHppY2Jveiwg
UklTQ1ZfSVNBX0VYVF9aSUNCT1osIHJpc2N2X3hsaW51eGVudmNmZ19leHRzKSwKPiA+ICsgICAg
ICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHppY2ZpbHAsIFJJU0NWX0lTQV9FWFRfWklDRklM
UCwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAo+ID4gKyAgICAgICBfX1JJU0NWX0lTQV9FWFRf
U1VQRVJTRVQoemljZmlzcywgUklTQ1ZfSVNBX0VYVF9aSUNGSVNTLCByaXNjdl94bGludXhlbnZj
ZmdfZXh0cyksCj4gPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppY250ciwgUklTQ1Zf
SVNBX0VYVF9aSUNOVFIpLAo+ID4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNvbmQs
IFJJU0NWX0lTQV9FWFRfWklDT05EKSwKPiA+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEo
emljc3IsIFJJU0NWX0lTQV9FWFRfWklDU1IpLAo+ID4gLS0KPiA+IDIuNDMuMgo+ID4KPiAKPiBU
aGFua3MsCj4gQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
