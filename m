Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC78FC590D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnUPd9KPU/82eulbOMZfWyAV9MdC7FHXuqnndzHPsdQ=; b=nATLaAkEqVd65i
	H8OrUmP6Ozrm4shp9vpz8ip8OTZH3C1VICTxBDmt7OBlsxr/hgrhOhjACLk488aLBvWdwDT0NOJ9T
	hNb51H8Jjbea2o3a1AczGl/Ctet7GuuACKMWqsXKSUsupZC125iI/h/ivxRfgEAp0IOX8iasG2C4b
	Mqph9UPtKCT7LCbwofKn4joGK3hyseu1t2Qtdziriyw0S7exKNKOSq0oJNjhB8r4uQvaLdSD+yCP1
	Clnm5rSYFrp6+4mFopcIQTDCxrU5PCmUQXeEIRa5OnsYHXRozTy2K45h4xsXEFh3sxqKzCyEUlPpy
	mxQmxpWJqWTf1SjM1XYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWiD-00000005eQJ-28oZ;
	Thu, 26 Feb 2026 08:27:09 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWiA-00000005ePT-2Un3
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 08:27:07 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-463901a0accso188428b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 00:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772094425; cv=none;
        d=google.com; s=arc-20240605;
        b=Nxtvo98T7ZmiTkUnuW/IlI/gRrpKeksPSAAfjHHa/8QI4Nb+qkspHlOuL7VBxJl29x
         Y/o2hrNC6tQe0fSWKiKYvASWR4zui1Fm65LyefPagxY7r+RilGTIVyNH/Obe8ySCy44U
         72ySe+bPoHniTvXC0yXaBQ/INLb2r9EockL2sVVdIH6+gCpjmbPTdYB6Z6+q4Yz6cxZ7
         KGM08USLpjLiVnrVidYaAs++10b4/VhyelKVVlpHjKX/BISNXhaGaEGd7oSrsDCaFuMv
         Jjt+uwicYzaEEp67Uj7ew86OxrNl9jIx84I/0TfeFlBPesnQcfAN/e/lf2mL71ip+ixj
         Q+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c/ICbugoA6WizD9YzJqu5d/QsSy74tGoyiRxnjKunfQ=;
        fh=cB5N0EVNBULKJ0nvw95Ge2I46MwKJbaX/aQYRwoAcDw=;
        b=RGosx0tutYcD9kB+/7DuYG+ZiV0mr+970BuODpKRd8olu4C+AicyqtwGanPvn/lg3x
         8Y8Se+wKi7TgVsls7BjNJHW9TBaggdCEVjc2vXPdUgcGUs7o0s+Apnw5Tnj7dfD7ZNzF
         U9SarE0N3Y41L1lTQXsLxglZIwm8Yme6ds/BPn1X3FjNCbfTH/NKoiN/qPgvrCZ7+p87
         qjTeYXE/ZARs59rq1JCxktaSjM40QW+b4iAP9dnkX5y1gJVd6+jw0NyRU/T5f6KU1r3J
         u7FLWLD2UGJmr5EdWigE3PIudL1ZKiWlHtoAEX89RakFfo78RM50nq5Vq0lOkVjLp8qC
         MdzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772094425; x=1772699225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/ICbugoA6WizD9YzJqu5d/QsSy74tGoyiRxnjKunfQ=;
        b=LOIjYxXtXIM7XemEUqCvlA0a7uKfvM6GctBQLP00X+05xo/JtnyRpmtgw5xgt5JcWv
         xusqJiMKG0NbRvYHChdG3wcb0Is9YnSg8hecL6gRonqELkKr/EudMdLClgI1gUPNCK/3
         uadjkhOXQYM3KRjQO1IA+OwyrGW2ZxucDBQbxpH1DzhYY7hRDbunA99y46HWqwuDe3sM
         4HWwmKOOQxCS1StexlXXyMRUAuXzt6k0uyjcyAvz4e8kQkh1f1SZzhIFEkU0P64IOufR
         mPLVJzH2cY7giGPCcQ8iK2wHGXYQ2LlM4p5Q5IO64hmgI8q2fMuvupZb+Sk3P4gbyEuW
         jD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772094425; x=1772699225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c/ICbugoA6WizD9YzJqu5d/QsSy74tGoyiRxnjKunfQ=;
        b=tnMsPVS+5N1F5w5RbGkBl/N9kDbndvhbIdoeDyikFbC8vQRlVHMwPmvDITiqdLrFZ/
         /+LVlWjIEJPYC3nivJkVitiaO0stEQTZIdhwkFTx06JO5B4NJaIabaONXMpoAoeKkgCM
         UfgaPAPiBgBiky2L9zra4x/0S0JLhLIcxYUgzWIEhHX8jAfRRN7GAlymhyUcHKhMkIH8
         iiuUzGZBnC07jxyz/hAB0Yo9C1h5L0WwSfTRrz0C9+ioe6Ngk6+ju71a9XVXjKsy0k1d
         px7qsQsKTBf3FdWD+s7b3PSwy1Y3fuwksbvw+vT76nH84X1WmXjI3QmG37vfPmmFTeZr
         Rn5A==
X-Forwarded-Encrypted: i=1; AJvYcCXWcqt5H9GL5yVPTQB9nUWizNV4ujKpM1XLMYkoBwduV0Z0vGUeuhUNkLJTo892HmCEvLTaC7eUDMFJxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOK0Fu2P2cNKHAU2ZwDu0Pl+SsIeUKmp45nWjVo+DnCBW4Zsmx
	bAdam6xi+BESVWwh4ZavlXlMzP7JJ7KiwxpFLaw40xeatgBmrT6NCSHXGRZaeFnK4x7u3AcXgvS
	gLSAA51r7qEKSsoj8YrWXK/+EJKq1odSKjD41eN1YsQ==
X-Gm-Gg: ATEYQzwwDn45Yn1SfkQpG0WcrB1JdFXyF+pjp9ImOR5C54vHcqJiPi0zvVfAvPFhMQu
	5crSdismwlq5xL6Wed48tWK9VXGLlsry601WTq7zuKxjvzJjbsL/kfFxHnXZ5rl6+lQr1gheLkh
	NNj2R69cMh8/3t0DMOswssXUcvQT3JO8wXdUmkmL1BPJlF+nIc7Rom9GMZGfwqZxpRY67WqhYai
	AXqok8/wVbOIAlxxcf7qFuIvspcepz9QbbXQXYSbKYTOzYdrTOPVbwiuyGtJtrNH8xhlUPb+3Ek
	pltRO1KvZtz2hG+zNowRkL35CulzDu95RK5jlaNx8E75NCFFYzjtoY89Mbt8oEjWtOaIiyM/luR
	tlxs6d7ikX8un+dmlwoniJ7AU4Jk=
X-Received: by 2002:a05:6820:3089:b0:662:e066:73a1 with SMTP id
 006d021491bc7-679ef99f2b5mr1441047eaf.57.1772094425138; Thu, 26 Feb 2026
 00:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20260202040059.1801167-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260202040059.1801167-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 13:56:54 +0530
X-Gm-Features: AaiRm50zPpJQ_8TX6H_H2wb8v6zCwRfi4OTEl3SKr95vU0yOnW4cyE4K-Z1oy2I
Message-ID: <CAAhSdy3V2kipH8sPzXkmnXP=Sh=7wwqhHaAWDyucJnytbL+qtw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_gstage_get_leaf()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_002706_845474_0F958D6F 
X-CRM114-Status: GOOD (  16.93  )
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

T24gTW9uLCBGZWIgMiwgMjAyNiBhdCA5OjMx4oCvQU0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gV2hpbGUgZnV6emluZyBLVk0gb24gUklTQy1WLCBhIHVz
ZS1hZnRlci1mcmVlIHdhcyBvYnNlcnZlZCBpbgo+IGt2bV9yaXNjdl9nc3RhZ2VfZ2V0X2xlYWYo
KSwgIHdoZXJlIHB0ZXBfZ2V0KCkgZGVyZWZlcmVuY2VzIGEKPiBmcmVlZCBnc3RhZ2UgcGFnZSB0
YWJsZSBwYWdlIGR1cmluZyBnZm4gdW5tYXAuCj4KPiBUaGUgY3Jhc2ggbWFuaWZlc3RzIGFzOgo+
ICAgdXNlLWFmdGVyLWZyZWUgaW4gcHRlcF9nZXQgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmg6MzQw
IFtpbmxpbmVdCj4gICB1c2UtYWZ0ZXItZnJlZSBpbiBrdm1fcmlzY3ZfZ3N0YWdlX2dldF9sZWFm
IGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jOjg5Cj4gICBDYWxsIFRyYWNlOgo+ICAgICBwdGVwX2dl
dCBpbmNsdWRlL2xpbnV4L3BndGFibGUuaDozNDAgW2lubGluZV0KPiAgICAga3ZtX3Jpc2N2X2dz
dGFnZV9nZXRfbGVhZisweDJlYS8weDM1OCBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYzo4OQo+ICAg
ICBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3JhbmdlKzB4ZjAvMHgzMDggYXJjaC9yaXNjdi9rdm0v
Z3N0YWdlLmM6MjY1Cj4gICAgIGt2bV91bm1hcF9nZm5fcmFuZ2UrMHgxNjgvMHgxZmMgYXJjaC9y
aXNjdi9rdm0vbW11LmM6MjU2Cj4gICAgIGt2bV9tbXVfdW5tYXBfZ2ZuX3JhbmdlIHZpcnQva3Zt
L2t2bV9tYWluLmM6NzI0IFtpbmxpbmVdCj4gICBwYWdlIGxhc3QgZnJlZSBwaWQgODA4IHRnaWQg
ODA4IHN0YWNrIHRyYWNlOgo+ICAgICBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKzB4MWI2LzB4MjZh
IGFyY2gvcmlzY3Yva3ZtL21tdS5jOjQ1Nwo+ICAgICBrdm1fYXJjaF9mbHVzaF9zaGFkb3dfYWxs
KzB4MWEvMHgyNCBhcmNoL3Jpc2N2L2t2bS9tbXUuYzoxMzQKPiAgICAga3ZtX2ZsdXNoX3NoYWRv
d19hbGwgdmlydC9rdm0va3ZtX21haW4uYzozNDQgW2lubGluZV0KPgo+IFRoZSBVQUYgaXMgY2F1
c2VkIGJ5IGdzdGFnZSBwYWdlIHRhYmxlIHdhbGtzIHJ1bm5pbmcgY29uY3VycmVudGx5IHdpdGgK
PiBnc3RhZ2UgcGdkIHRlYXJkb3duLiBJbiBwYXJ0aWN1bGFyLCBrdm1fdW5tYXBfZ2ZuX3Jhbmdl
KCkgY2FuIHRyYXZlcnNlCj4gZ3N0YWdlIHBhZ2UgdGFibGVzIHdoaWxlIGt2bV9hcmNoX2ZsdXNo
X3NoYWRvd19hbGwoKSBmcmVlcyB0aGUgcGdkLAo+IGxlYWRpbmcgdG8gdXNlLWFmdGVyLWZyZWUg
b2YgcGFnZSB0YWJsZSBwYWdlcy4KPgo+IEZpeCB0aGUgaXNzdWUgYnkgc2VyaWFsaXppbmcgZ3N0
YWdlIHVubWFwIGFuZCBwZ2QgdGVhcmRvd24gd2l0aAo+IGt2bS0+bW11X2xvY2suIEhvbGRpbmcg
bW11X2xvY2sgZW5zdXJlcyB0aGF0IGdzdGFnZSBwYWdlIHRhYmxlcwo+IHJlbWFpbiB2YWxpZCBm
b3IgdGhlIGR1cmF0aW9uIG9mIHVubWFwIG9wZXJhdGlvbnMgYW5kIHByZXZlbnRzCj4gY29uY3Vy
cmVudCBmcmVlcy4KPgo+IFRoaXMgbWF0Y2hlcyBleGlzdGluZyBSSVNDLVYgS1ZNIHVzYWdlIG9m
IG1tdV9sb2NrIHRvIHByb3RlY3QgZ3N0YWdlCj4gbWFwL3VubWFwIG9wZXJhdGlvbnMsIGUuZy4g
a3ZtX3Jpc2N2X21tdV9pb3VubWFwLgo+Cj4gRml4ZXM6IGRkODJlMzU2MzhkNjdmICgiUklTQy1W
OiBLVk06IEZhY3Rvci1vdXQgZy1zdGFnZSBwYWdlIHRhYmxlIG1hbmFnZW1lbnQiKQo+IFNpZ25l
ZC1vZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1v
ZmYtYnk6IEppYWthaSBYdSA8amlha2FpUGVhbnV0QGdtYWlsLmNvbT4KPiAtLS0KPiBWMSAtPiBW
MjogUmVtb3ZlZCBrdm0tPm1tdV9sb2NrIGluIGt2bV9hcmNoX2ZsdXNoX3NoYWRvd19hbGwoKS4K
Pgo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9y
aXNjdi9rdm0vbW11LmMKPiBpbmRleCBhMWMzYjJlYzFkZGU1Li4xZDcxYzFjYjQyOWNhIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11
LmMKPiBAQCAtMjY4LDkgKzI2OCwxMSBAQCBib29sIGt2bV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpCj4gICAgICAgICBnc3RhZ2Uu
ZmxhZ3MgPSAwOwo+ICAgICAgICAgZ3N0YWdlLnZtaWQgPSBSRUFEX09OQ0Uoa3ZtLT5hcmNoLnZt
aWQudm1pZCk7Cj4gICAgICAgICBnc3RhZ2UucGdkID0ga3ZtLT5hcmNoLnBnZDsKPiArICAgICAg
IHNwaW5fbG9jaygma3ZtLT5tbXVfbG9jayk7CgpVbmNvbmRpdGlvbmFsbHkgbG9ja2luZyBtbXVf
bG9jayBvdmVyIGhlcmUgY2F1c2UgZm9sbG93aW5nIGNyYXNoCndoZW4gcG93ZXJpbmcgb2ZmIHRo
ZSBLVk0gR3Vlc3QuCgpbICAgODguOTg1ODg5XSByY3U6IElORk86IHJjdV9zY2hlZCBzZWxmLWRl
dGVjdGVkIHN0YWxsIG9uIENQVQpbICAgODguOTg2NzIxXSByY3U6ICAgICAxLS4uLi46ICg1MjQ5
IHRpY2tzIHRoaXMgR1ApCmlkbGU9OTE4NC8xLzB4NDAwMDAwMDAwMDAwMDAwMCBzb2Z0aXJxPTE3
NS8xNzUgZnFzPTIyMjMKWyAgIDg4Ljk4NzgxNl0gcmN1OiAgICAgKHQ9NTI1MCBqaWZmaWVzIGc9
LTc5MSBxPTMxIG5jcHVzPTQpClsgICA4OC45ODg5OTNdIENQVTogMSBVSUQ6IDAgUElEOiA3OCBD
b21tOiBsa3ZtLXN0YXRpYyBOb3QgdGFpbnRlZAo3LjAuMC1yYzEtMDAwMDItZ2YyNDJmM2YzNTNl
Ni1kaXJ0eSAjMyBQUkVFTVBUTEFaWQpbICAgODguOTg5Mjk0XSBIYXJkd2FyZSBuYW1lOiByaXNj
di12aXJ0aW8scWVtdSAoRFQpClsgICA4OC45ODk0MDFdIGVwYyA6IHF1ZXVlZF9zcGluX2xvY2tf
c2xvd3BhdGgrMHg1NC8weDQ3NApbICAgODguOTkwMTQ0XSAgcmEgOiBkb19yYXdfc3Bpbl9sb2Nr
KzB4YWEvMHhkMApbICAgODguOTkwMTgyXSBlcGMgOiBmZmZmZmZmZjgwYmM3NDA0IHJhIDogZmZm
ZmZmZmY4MDA4OTNlYSBzcCA6CmZmMjAwMDAwMDAzYmI4ZDAKWyAgIDg4Ljk5MDIxM10gIGdwIDog
ZmZmZmZmZmY4MWEzMjQ5MCB0cCA6IGZmNjAwMDAwMDIzNjBjODAgdDAgOgo2MTZkNmU3NTVmNmQ3
NjZiClsgICA4OC45OTAyMzFdICB0MSA6IDAwMDAwMDAwZmZmZmYwMDAgdDIgOiA3MDYxNmQ2ZTc1
NWY2ZDc2IHMwIDoKZmYyMDAwMDAwMDNiYjhlMApbICAgODguOTkwMjg2XSAgczEgOiAwMDAwN2Zm
ZjdmNjAwMDAwIGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6CmZmNjAwMDAwMDQ3YjcwMDAKWyAg
IDg4Ljk5MDMwNF0gIGEyIDogMDAwMDAwMDAwMDAwMDBmZiBhMyA6IDAwMDAwMDAwMDAwMDAwMDAg
YTQgOgowMDAwMDAwMDAwMDAwMDAxClsgICA4OC45OTAzMjJdICBhNSA6IGZmNjAwMDAwMDQ3Yjcw
MDAgYTYgOiBmZmZmZmZmZjgxODc2ODA4IGE3IDoKODAwMDAwMDBmZmZmZjAwMApbICAgODguOTkw
MzQxXSAgczIgOiBmZjYwMDAwMDA0N2I3MDAwIHMzIDogZmY2MDAwMDAwNDdiN2E5MCBzNCA6CjAw
MDAwMDAwMDAwMDAwMDAKWyAgIDg4Ljk5MDM1OV0gIHM1IDogMDAwMDdmZmY4ZjYwMDAwMCBzNiA6
IDAwMDAwMDAwMDAwMDAwMDEgczcgOgowMDAwMDAwMDAwMDAwMDAxClsgICA4OC45OTAzNzhdICBz
OCA6IDAwMDAwMDAwMDAwMDBmZmYgczkgOiBmZjYwMDAwMDA0N2I3NDg4IHMxMDoKZmZmZmZmZmZm
ZmZmZmZlMApbICAgODguOTkwMzk2XSAgczExOiBmZjYwMDAwMDAzYjhlMDUwIHQzIDogZmZmZmZm
ZmY4MWE0OWViNyB0NCA6CmZmZmZmZmZmODFhNDllYjcKWyAgIDg4Ljk5MDQzM10gIHQ1IDogZmZm
ZmZmZmY4MWE0OWViOCB0NiA6IGZmMjAwMDAwMDAzYmI3Mjggc3NwIDoKMDAwMDAwMDAwMDAwMDAw
MApbICAgODguOTkwNDUxXSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAw
MDAwMDAwMDAwMApjYXVzZTogODAwMDAwMDAwMDAwMDAwNQpbICAgODguOTkwNTgxXSBbPGZmZmZm
ZmZmODBiYzc0MDQ+XSBxdWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKzB4NTQvMHg0NzQKWyAgIDg4
Ljk5MDY5Nl0gWzxmZmZmZmZmZjgwYmM3MDRlPl0gX3Jhd19zcGluX2xvY2srMHgxYS8weDI0Clsg
ICA4OC45OTA5MTddIFs8ZmZmZmZmZmYwMWFiNGE1OD5dIGt2bV91bm1hcF9nZm5fcmFuZ2UrMHg5
OC8weGM4IFtrdm1dClsgICA4OC45OTE0MTVdIFs8ZmZmZmZmZmYwMWFhNWQyMj5dCmt2bV9tbXVf
bm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydCsweDE3ZS8weDMyNCBba3ZtXQpbICAgODgu
OTkxNjA4XSBbPGZmZmZmZmZmODAyN2Y2ZGE+XQpfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3Jh
bmdlX3N0YXJ0KzB4NjIvMHgxYmMKWyAgIDg4Ljk5MTYzNV0gWzxmZmZmZmZmZjgwMjJkNTU0Pl0g
dW5tYXBfdm1hcysweDEyMC8weDEzNApbICAgODguOTkxNjU0XSBbPGZmZmZmZmZmODAyNGNjMGE+
XSB1bm1hcF9yZWdpb24rMHg3Ni8weGMwClsgICA4OC45OTE2NzVdIFs8ZmZmZmZmZmY4MDI0Y2Qx
OD5dIHZtc19jb21wbGV0ZV9tdW5tYXBfdm1hcysweGM0LzB4MWMwClsgICA4OC45OTE2OTVdIFs8
ZmZmZmZmZmY4MDI0ZGQ1ZT5dIGRvX3ZtaV9hbGlnbl9tdW5tYXArMHgxNTIvMHgxNzgKWyAgIDg4
Ljk5MTcxNl0gWzxmZmZmZmZmZjgwMjRkZTI0Pl0gZG9fdm1pX211bm1hcCsweGEwLzB4MTQ4Clsg
ICA4OC45OTE3MzZdIFs8ZmZmZmZmZmY4MDI0ZjRiMj5dIF9fdm1fbXVubWFwKzB4YWEvMHgxNDAK
WyAgIDg4Ljk5MTc1N10gWzxmZmZmZmZmZjgwMjM4OWM4Pl0gX19yaXNjdl9zeXNfbXVubWFwKzB4
MzgvMHg0MApbICAgODguOTkxNzc4XSBbPGZmZmZmZmZmODBiYmIwNDg+XSBkb190cmFwX2VjYWxs
X3UrMHgyNjAvMHg0NWMKWyAgIDg4Ljk5MTgxMl0gWzxmZmZmZmZmZjgwYmM4N2EwPl0gaGFuZGxl
X2V4Y2VwdGlvbisweDE2OC8weDE3NAoKSW5zdGVhZCwgd2Ugc2hvdWxkIG9ubHkgdGFrZSBtbXVf
bG9jayBpZiBpdCB3YXMgdW5sb2NrZWQgcHJldmlvdXNseS4KClNvbWV0aGluZyBsaWtlIHRoaXMg
Li4uCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9t
bXUuYwppbmRleCAwYjc1ZWIyYTE4MjAuLjg3YzhmNDE0ODJjNSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKQEAgLTI0NSw2ICsyNDUs
NyBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwK
IGJvb2wga3ZtX3VubWFwX2dmbl9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZ2Zu
X3JhbmdlICpyYW5nZSkKIHsKICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7CisgICAg
ICAgYm9vbCBtbXVfbG9ja2VkOwoKICAgICAgICBpZiAoIWt2bS0+YXJjaC5wZ2QpCiAgICAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7CkBAIC0yNTMsOSArMjU0LDEyIEBAIGJvb2wga3ZtX3VubWFw
X2dmbl9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdAprdm1fZ2ZuX3JhbmdlICpyYW5nZSkK
ICAgICAgICBnc3RhZ2UuZmxhZ3MgPSAwOwogICAgICAgIGdzdGFnZS52bWlkID0gUkVBRF9PTkNF
KGt2bS0+YXJjaC52bWlkLnZtaWQpOwogICAgICAgIGdzdGFnZS5wZ2QgPSBrdm0tPmFyY2gucGdk
OworICAgICAgIG1tdV9sb2NrZWQgPSBzcGluX3RyeWxvY2soJmt2bS0+bW11X2xvY2spOwogICAg
ICAgIGt2bV9yaXNjdl9nc3RhZ2VfdW5tYXBfcmFuZ2UoJmdzdGFnZSwgcmFuZ2UtPnN0YXJ0IDw8
IFBBR0VfU0hJRlQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocmFuZ2Ut
PmVuZCAtIHJhbmdlLT5zdGFydCkgPDwgUEFHRV9TSElGVCwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJhbmdlLT5tYXlfYmxvY2spOworICAgICAgIGlmIChtbXVfbG9ja2Vk
KQorICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOwogICAgICAgIHJl
dHVybiBmYWxzZTsKIH0KCkkgaGF2ZSB0YWtlIGNhcmUgb2YgdGhpcyBhbmQgcXVldWVkIGFzIGZp
eCBmb3IgTGludXgtNy4wLXJjWAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
