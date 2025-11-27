Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A2D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myntLv48f22YspvZ+R/6htl8mjCY+aSKNCOaSAznPcw=; b=Hfa4IRPmvkMEp2
	M3D3ZLSoQOBKgMzNNvYcksQwtOz44Jw9ywbqwp9oIaVeIG71O+7wf2XEjVAbfIh7iwle8wwsSnF69
	/CeKTroJ29WlGpB/Pq7T6eCyNgghAMTroUjl3SMiJLQChQrbuCivsz1mQLsBom6MhJjDAydevHOjC
	PoUVaHXyR/Asj4BjYIaNBSBswhqqbxFQMoMN0B8iigE2+wPS5DTrtgH1oDAYkcxXXjVia+NhSD4BB
	LoaNJ0bvzDKFM3/SuOULkgE14QYWb7TYg45p8723bIQyypXYj7xSeHgm9ltlzIhvDFjsIW4QQMWgt
	kbEx99l1VdJuCzd0+Dmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ46-0000000GMWz-1VaV;
	Thu, 27 Nov 2025 10:17:30 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ44-0000000GMWc-1O78
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 10:17:29 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b2d7c38352so177061385a.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 02:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764238647; x=1764843447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVqJXuu8/gcjx6D6wFmCFD9XoKlEthbHfqoDpmxDK6c=;
        b=QLeLoZD2nNnHQ8IEehzGXzFD3yL7TG4vjgRCgOo36USNlLqAEDDCAmB7dlk/OzUxAj
         W7t0qC7EueF0AN4Y9+jQiybomZX47G1dsJMLXUb4K7uCR0OZzi+YIhhfzPnvhOigy5Sw
         uS9CytRAudzjcOsfjYaqhVI/NqpdOEFLPoaf54QjG024zueYBqzx5egV3S1OdPr2Tfu3
         01AhT8n3ktl0R4tqUKsBIZa39f2zJxXQiEu6LptjWkQVs28Gghz7WkrG3seCHuKwSgRV
         GwIoiae4sYPsCb2snbFwXlCQFC2/LwsdVHKAHNaI31uA3Va3WCnS28aLJ/OV74W8UqFb
         W5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238647; x=1764843447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVqJXuu8/gcjx6D6wFmCFD9XoKlEthbHfqoDpmxDK6c=;
        b=KCVsO2HSrBl29u3ea2B3ttSJ/KiLwBzsJWw06jQtOdGpYaMf7C0xhkHWFe8U0hOIVw
         rfxXH5KzmTzGmvWiF65eemIc1maYerRdxc6NyUENNfGrP323v8K/8/5tSOfWTeCofG7v
         3oWsnbn6kQ/kqa/e99Antfhb+qhbAzM5SjwZdiR28QoBLR/q1uhPeNEJnmG/azCxb0U8
         iIbTmZu18Govb5LO8kvttHiAmf991S924n0S9KBw51177fCpb78iC/I58azeMpgC8euB
         c+Nhuo/MJUZdEaTKcp/vK1jwhJqJ7d7W8AsClBs1k5NOsurpJMGqsnEupo0mtUABJMg9
         M7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUwJdIuS2EqE4oPmr7dWRkeyyQJLYrr3EUf8J+eLcLHeuDAv+IX2/vtlJtuZy1hsqYGA/1IODqDFb1EoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF9qDdN3xkDT0ovnCi6YBtMNaeUKppHRb7+BkaVtIV+sa8w4ji
	dLq9l5yID8ffp4Fti9POsxXBGh5oglnN+828fiOeMGIPug+LY28C1Xvzc5MXYcEQy2XEiqlWOg8
	/CZWIJFMMt6+wvsH/uHJJilmfirowVuKXzwitY/s3rQ==
X-Gm-Gg: ASbGncvsHlRd/AfrOVYowd/VdmzKFKGPyWHqFsXpcCbZdtSu3DmB/5FT5RtlcC739S1
	3nhSmbJ9wa5y5I33JPBlNPVfG857c7NfmH/iByy43+1r+5CyjClvqngoYu2TjS9zcyHQqUiX6G5
	bPgW2LjNKyYitdnBabW2+co1n0ylEYi1NJt1dqUJkBS7MaspZ96Hjm/zh+rd1e5u28J9Z+h6T6G
	fZIeygu+nd2t6HkKB2OU1d8PXyWUC7afQIAhTiAPtJEgMK3pg7nGLaLsfLCRRLbiZSb4e4+7p5K
	1KeTzG3rpX0+zmyhGUgeG55ZVOs5
X-Google-Smtp-Source: AGHT+IGH509wkRMF5fU9j+Apaf/6aWrmP5Oa6G2uFMSVCrs2stfQ0BAlcvOCFBrcjRAJhvr9dr8vKB6/6WHGQs10DrI=
X-Received: by 2002:a05:620a:44c7:b0:8b2:62ae:acba with SMTP id
 af79cd13be357-8b32ad0e57fmr3630615685a.26.1764238646684; Thu, 27 Nov 2025
 02:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20250710125231.653967-1-hchauhan@ventanamicro.com>
 <20250710125231.653967-3-hchauhan@ventanamicro.com> <0b77ac0f-a18f-e577-ff92-98ddd1d2bed8@kernel.org>
In-Reply-To: <0b77ac0f-a18f-e577-ff92-98ddd1d2bed8@kernel.org>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 27 Nov 2025 15:47:15 +0530
X-Gm-Features: AWmQ_bmZtSdoyBXhn-Rho3Iukc1U0L0a9hs5ahGqe4C0Z5g7c3CjtuPqypNxyIM
Message-ID: <CAPd4WexedtEx7g4bYVB5LpjZGUQV2YCGWw-Bq8_njRzAh5MedA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: Introduce support for hardware break/watchpoints
To: Paul Walmsley <pjw@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_021728_382680_09237983 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

SGkgUGF1bCwKCk9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDY6MTnigK9BTSBQYXVsIFdhbG1zbGV5
IDxwandAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDEwIEp1bCAyMDI1LCBIaW1hbnNo
dSBDaGF1aGFuIHdyb3RlOgo+Cj4gPiBSSVNDLVYgaGFyZHdhcmUgYnJlYWtwb2ludCBmcmFtZXdv
cmsgaXMgYnVpbHQgb24gdG9wIG9mIHBlcmYgc3Vic3lzdGVtCj4gPiBhbmQgdXNlcyBTQkkgZGVi
dWcgdHJpZ2dlciBleHRlbnNpb24gdG8KPiA+IGluc3RhbGwvdW5pbnN0YWxsL3VwZGF0ZS9lbmFi
bGUvZGlzYWJsZSBoYXJkd2FyZSB0cmlnZ2VycyBhcyBzcGVjaWZpZWQKPiA+IGluIFNkdHJpZyBJ
U0EgZXh0ZW5zaW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhj
aGF1aGFuQHZlbnRhbmFtaWNyby5jb20+Cj4KPiBUYWxraW5nIHdpdGggQW51cCwgaXQgc291bmRz
IGxpa2UgeW91J3JlIHBsYW5uaW5nIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZgo+IHRoaXMgb25lLCBz
byB3aWxsIGhvbGQgb2ZmIG9uIGl0LgoKVGhhdCdzIGNvcnJlY3QuIFlvdSBjYW4gaG9sZCB0aGlz
IHZlcnNpb24uIEkgd2lsbCBiZSBwb3N0aW5nIHYyIGZvcgp0aGlzIHNlcmllcyB3aGljaCB5b3Ug
Y2FuIHRhcmdldCBmb3IgNi4yMC4KClJlZ2FyZHMKSGltYW5zaHUKCj4KPgo+IC0gUGF1bAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
