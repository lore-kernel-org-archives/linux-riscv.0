Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7646FCA6002
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 05:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4a3Opch2jWzJp6/kugiY7tRKjTPFhIQbAxRrYggcP+8=; b=GbI31c8XgmwZsO
	SdhFzaLe8O3julpVe1yMA7mA5TZKFt1brGfumCET3RT1zInE3m/qOmo7/jXOfPT8AEloHJTDMOUba
	H0af0wbrk8t3hYA+QBy70a35GXNPcohSummaUHuv7W9tPY27VNk3QEq3SBr1+FIPXCEihfHi9Th31
	Xr/qcKYYjHSleBdBTZhfdEhc8xkVQ5pFEXR22MsXy8OjruAp9d7IUOX7BWA2UjYxD8Yu+dq7EQiRO
	Ec1iWxspp7bSfp+15T2bbObHZi91ybK4bT4W5RZWUfwkVFlT84nO4QPRSvBFsLve5uFitSrm1mh63
	BgEzHtN/WGARQqFvp5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEguQ-00000003ZQx-0pEH;
	Thu, 08 Oct 2026 05:43:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEguN-00000003ZQP-3DTD
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 05:43:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a9bd4db6ccso6507462a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 22:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791438189; cv=none;
        d=google.com; s=arc-20260327;
        b=JQhKFvh/RmO1G96/kqAwsd19Rn+3V9Qea8ivNdygQJHQs1m2xwvNz+e0X0Dn4pryld
         KQO8OUAvba8HKI75tUwPbT30pB2ys2YhJ9ac1+hzMw/rh/M0i6PpJ6tHuO4cWbvXeBju
         qFdhqAzwCUGXWZYTnhBUypSnvSgxyo091QIYY5JU7WzFjSgEaC43JEc0znUyno71WNfc
         RbsgLI1ccBT0u9d1Q18OFuvNqiZB102Q9VeAeAuMx+Bj77cUcYqcqcqCaPjCSuBW1pKR
         7lvcFHH18bczO5wuaDuGBF8vM6rtYfrb+0Wjvgr8w6jTwj4v13QOtQqIA3NwPOkffy8+
         C3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFQVP3Icf9nV+7X1cbKmKKwaGAM1phqqNnkrhrVM1G0=;
        fh=sGr5fP0nZ0ObzIPgRRdZ/sOOsuRoIr3zRBnKN/NLIPQ=;
        b=VDi+4c39R2OxBqXha3vtfNlaSBHDcvFBiP8z7IfQWxkyCGFh+ZBZ8xkhXAk+gdA5LW
         Knzm0ZZ9mSvjBycP+LNuHaGS1gafQKQU/FpYPHV3f0R2Lbgugs19XE0yYQnUlH5COoHJ
         q5FLyKqIjpoStBKRNBalVOMHb+sFgM/NsEZKlhXmmrktGveEfyLmQBJJPJgxDPPJzhXg
         PqOPLOIrrY4T0HkOUbHZsNwxsD5rAgbQJVNb9VQtzgYwFPM2Vq/lPwZPccBZW8IbnoY3
         wMQjAwglP6ZDbPnxIFlHrrfq0n3WpfDHWCoM3cr9F5uv07psHGGhdNwbHkiXiHY5voDI
         ABmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791438189; x=1792042989; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFQVP3Icf9nV+7X1cbKmKKwaGAM1phqqNnkrhrVM1G0=;
        b=lZJLuA7AR5j7RXnoZ8lmz6a+cRqBCK70lDpbXjpkP/m+Y8SGADEe1ASLqYilgtxCR9
         6Gt4B2japGFTs8VyFWV9o2KSz1zc7xCe+2yHkS6Z7GRwh4F9MUK79MVaNMl5tnOWYJUy
         ljco3lHlZbz6P4gFSDRRVmY6Cm3lLznmc2W5OQ/hmJzr8oBB/kCp59GIpSMzb6Re8mFD
         bEQz2WI9KhLb48MTKw5DEekrTc96Q2kTLi17NIvDaNuzs/c63LxUkWsgx1jA/NhaqwWW
         VysNpmBnHZ0vIVP/admBFIqi/PgUqNdCutJQOo877EuHCdZ3zq+TqkY6JB9cJ3u/9NHR
         RRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438189; x=1792042989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFQVP3Icf9nV+7X1cbKmKKwaGAM1phqqNnkrhrVM1G0=;
        b=KlFQ5qX79PBx2NoH9W8E36lcAL83dPbm+vvS6tmywRWtrwsyUYtcGkybLWd/FErAtN
         CJxNAO4C+bhskOhNCgGs0STv9asnMJWDgqKeKCsvkTGbGcr3TPsHKxFaFA6BeP4YpGQ3
         HnEPfhZ7uvdjB+CxVoBgymDSiX4jh57HK2RbXg2O+kLNPJ3Km3N9dikGhBPH6ioDQ23X
         KpKh3EX6E3+rwAS3l8tBMT2snFlKdMYNOJkp3b59MjwhrJrK/edUaJQXlPykI3qT9tl5
         b9qisrGVjlZ0CopHzjaPdBU5R9UKgPFEZ3GDA4XpNP3bfpceRw+xwc99HsYt78QC9beK
         +hYg==
X-Forwarded-Encrypted: i=1; AKwUvBxCD253B5YImy11fYCsngcLzk34g5wkULRQVc+JC6BRkBBZUIguOqIL/JMfRiwJ5CwpanSHELbUvK+HeQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIblSKSC5RFDOaNPYlK5FhCXejWjBzsKqyfbTE+KWg2Yb8vc/Lt
	fiMnCWwudBx+73w684Pj6OPkw3dPwTkKHuEgFrT3kTOblOezEabFQbfzPSxAQOYS5+Qa1hEsKc9
	ecSAskHV9VzBYzZHXjIE7GnEwZ+avJ525sx3DLvc7ONqPWUT93ZCr/PcSFQ==
X-Gm-Gg: AYBFou29FDgyuDGU/HNqFWGm4PeC1dFeGBqO9DYr+o9XR/KCHZxutPEc/BP8iySXVh4
	Ey5AjElJxnuddlottV6ZwAAR1OmJtvCypzuPgtLxRJr9hYed02Wnchz1/G/HRH/xgkS7G0QKRm0
	WD5OCF4FGS4IAHNEX+mKs1MN13DE1cEqjIrq1tXxwheMaY8thx1bchjDNQpoJWMsEJY7GLcAfsN
	gpuM82wexf7WGmBLskhK0Hu9zSVlwtX6dWVFgAEGzpafNACt3JKQJFJ3ijkBbdyfWroMUyv8NK7
	YZZsKmf6N9oxLkwcf4dVuQSyr+LbhXm7WazQfoX8PG0EYOQAWvsnMBi71Q==
X-Received: by 2002:a05:6402:3202:b0:6a7:ee54:f897 with SMTP id
 4fb4d7f45d1cf-6aff294e101mr4619974a12.27.1791438189378; Wed, 07 Oct 2026
 22:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261007155748.291814-1-samuel.holland@sifive.com>
In-Reply-To: <20261007155748.291814-1-samuel.holland@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 8 Oct 2026 13:42:58 +0800
X-Gm-Features: AclHuK8I8WkGAy6FEtsbDPDqp3rqkxyTvnVbvD8DrWWrlvwiZCF72K8omXYE7co
Message-ID: <CANXhq0qVzjx+WOZNZYTt-X=aEut4b1c6Yp9S0rQXN8+z1hrZVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: cfi: Bounds check restore token before swap
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_224311_833912_DA0516FB 
X-CRM114-Status: GOOD (  17.57  )
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

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAxMTo1N+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSB0aGUgdXNlci1wcm92aWRl
ZCBzaGFkb3cgc3RhY2sgcmVzdG9yZSB0b2tlbiBpcyBub3QgY2hlY2tlZAo+IGJlZm9yZSBiZWlu
ZyB1c2VkIGFzIHRoZSBhZGRyZXNzIGluIHNzYW1vc3dhcC5kLiBXaGlsZSBhbiBpbnZhbGlkCj4g
cmVzdG9yZSB0b2tlbiB3aWxsIGJlIGNhdWdodCBhbmQgcmFpc2UgU0lHU0VHViwgdGhpcyBoYXBw
ZW5zIGFmdGVyCj4gd3JpdGluZyA0IGJ5dGVzIG9mIHplcm9lcyBhbnl3aGVyZSBpbiB0aGUgYWRk
cmVzcyBzcGFjZS4gQ2hlY2sgdGhhdCB0aGUKPiByZXN0b3JlIHRva2VuIGlzIGF0IGxlYXN0IGEg
dmFsaWQgdXNlciBhZGRyZXNzIGJlZm9yZSB0aGUgc3dhcCB0byBlbnN1cmUKPiB3ZSBkbyBub3Qg
c2NyaWJibGUgb3ZlciBrZXJuZWwgbWVtb3J5Lgo+Cj4gRml4ZXM6IDY2YzljNzEzZGU1OSAoInJp
c2N2L3NpZ25hbDogc2F2ZSBhbmQgcmVzdG9yZSB0aGUgc2hhZG93IHN0YWNrIG9uIGEgc2lnbmFs
IikKPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZl
LmNvbT4KPiAtLS0KPgo+ICBhcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgfCA1ICsrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91
c2VyY2ZpLmMKPiBpbmRleCBkZWMwYmE1ZWZmNWVhLi4yM2M0ZDZkOWQ4Y2JjIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3VzZXJjZmkuYwo+IEBAIC0yMDYsMTAgKzIwNiwxMyBAQCBpbnQgc2F2ZV91c2VyX3Noc3RrKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCB1bnNpZ25lZCBsb25nICpzYXZlZF9zaHN0a19wdHIpCj4g
ICAqLwo+ICBpbnQgcmVzdG9yZV91c2VyX3Noc3RrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCB1
bnNpZ25lZCBsb25nIHNoc3RrX3B0cikKPiAgewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBfX3Vz
ZXIgKnRva2VuX3B0ciA9ICh1bnNpZ25lZCBsb25nIF9fdXNlciAqKXNoc3RrX3B0cjsKPiAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgdG9rZW4gPSAwOwo+Cj4gLSAgICAgICB0b2tlbiA9IGFtb191c2Vy
X3Noc3RrKCh1bnNpZ25lZCBsb25nIF9fdXNlciAqKXNoc3RrX3B0ciwgMCk7Cj4gKyAgICAgICBp
ZiAoIWFjY2Vzc19vayh0b2tlbl9wdHIsIHNpemVvZih0b2tlbikpKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVGQVVMVDsKPgo+ICsgICAgICAgdG9rZW4gPSBhbW9fdXNlcl9zaHN0ayh0b2tl
bl9wdHIsIDApOwo+ICAgICAgICAgaWYgKHRva2VuID09IC0xKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVGQVVMVDsKPgoKTEdUTS4KClJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNp
Zml2ZS5jb20+Cgo+IC0tCj4gMi41Mi4wCj4KPiBiYXNlLWNvbW1pdDogYTkwZWU0MzA1YzRhNWRm
NzJjMTFiMzFkYWNmZGM3NmUwMGZjZjc4YQo+IGJyYW5jaDogdXAvY2ZpLWZpeGVzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
