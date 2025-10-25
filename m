Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB1CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hs7TsGItdiuiKVEJBafQmdDg8QjIR0XSVuX3Nst+ois=; b=Q2epHCTS0qRIbV
	cHhzE9tKFIRot2ZKrQjhCBl4SpOc3By6Os3036kgcYPnYdfxdZqNKyMaPU5TBQ+epwiYwY2CCK786
	l7J1sfRYHX/sAh3zBy73bHooqNUCR0sctj6VovLQnRg5g8/2AhPmaeMVA8qsSZrehReHv5RAd8Cl4
	YrMTcTIZmLmpaY9OqzFna5xtekU4AJZAP7QGgP8l596TSloTe8Fvh1PFCofyuofA3eTOuYTjQ6Lhc
	Vkc0HHd6fncmxq0+h42qtQEnJCdTFwAilBDrBYUstREOLHtvNOoV+soYYIaVDvw7S05k5wtXySWxS
	0fLS166IFOBt+T8SNtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgDw-0000000BObE-2Xdw;
	Sat, 25 Oct 2025 15:30:32 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgDu-0000000BOal-06FI
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 15:30:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-63c45c11be7so5390931a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761406228; x=1762011028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
        b=kTxnNW6xMEZ1mVI64hRyMHA68eaoj7s7opTY94CRyVkGGSDkcELfF1iIZdFQI+Eo0s
         2cQ6qepkYmvtXXwrG4xPEOVscRESlbkhhHXF+zM/yrJ9jXM2x6XUOikVSlprE2drhZYm
         /7l5RDofnDu0sr7vpByGib5N0lI0cYRmq7VLAr32EuQuoQGtps0ldH927czWYyxVymay
         I/Duxmb+SsAxeL/MjmSN1wotNfdsaUXm+/dOUWkVnAVdS2/fvo7JBxqhQkUrde1bccFY
         +QnwXQZJMSG0pzFIpC99F3MWM4395dnc74dW54tp9aSlXeTHJ5QI99mAsGLTgplBHBYb
         X3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406228; x=1762011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
        b=qtLE/jl91+AXQbaVFUDormpNk9krG+fDR+hlOIzpex0TkJb/wzXV44rc6+D8QkNjAK
         gTRMJzocPIU4VlhZM/cUW3FO19FB13fBjmWekCxJLfrxO0HOoxcmHbo1rHY5zFqbcrgR
         VW6p+4WHhYWVp0eOHwyN/6bWtmj6gy9XTuiDoDAZcIX8f9pPfzwX+LGHAX5wCp1Taxb0
         1SHFKzbVfCo7i/B57A4TQ//peGOCwKiah1ZwQJRF+kDZPLY50MzQnjNhtOBWXUoid+bs
         Hq5gUAqjTQbMVbooDziZwgsJJOUKaql8PeF6vRC9eAN2i7bStw2hPi+Ij2A+rogGxz0R
         PMpw==
X-Forwarded-Encrypted: i=1; AJvYcCVw6hB2HwMJGyY6bxozlDHgYaV1hfO21tDCJIZoj1C4w38KYR66UgU0cZlQynPj8/o3QUnJqJioLcZNrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkcpnrgC2AFNgNciSNo3I3Tus/GCq9h5o2ViYXYP6Fb0uWF9w3
	GvnqvuKc5Cfz/+oVcKIVWWBG4ls2JCAeUG1R1Lk5TnTdyhZQzfN8CWmzdhbIO3BDZwnP1fWcmhH
	LU6fR15dnXZMCRkgqkwcu5HHLWAVzCODPUo/aVcI5fQ==
X-Gm-Gg: ASbGncv9C8lUUoSxDuNEIG53yM/ohT/fBmKsP39NtxizGjM1SPjCPHGr6v9HPrNmcBh
	O5bYSR0Cxij8Xz+2XST/s9PsYr/RZ/qBIy/Ym/Y8HC8nS5zeR+oMgL+ddzbBUwr/SknFZ9vloq5
	P95G2U5hxuwuBTLLnh6iO6exhfqZfDiKPw50sF20xj+7h+vRyt05JG1R01VmAFaG74mxZyTk9YD
	ujKLyUv1QOJdpCmokeY2w+YN9lYKhXd8XRq4h2LnzOBqtGkb0t86ZZpzOcQT0tZdF3FzvXpFH8O
	/RBSSCfSAdaPGvXlPWN/LIRIHMDx
X-Google-Smtp-Source: AGHT+IHyii/MACqqA1gMbxyh8CZfZM/MVeB0dSh2M8XUI9vv6+1k3VQ9IQ7FPNSu6S0HuT0ITqx9emJSEDbCLG+Yc0Y=
X-Received: by 2002:a05:6402:350c:b0:61c:cf8d:e51d with SMTP id
 4fb4d7f45d1cf-63e6007d198mr5362602a12.22.1761406228044; Sat, 25 Oct 2025
 08:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <5-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <5-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:29:51 -0400
X-Gm-Features: AWmQ_bmUOgV3_0ASbOM3QoMzXfGDVzgu3GeEUS2HtNMs-zqEXMaBdqidVXde5tM
Message-ID: <CA+CK2bBHzGi-4dqXeQn+OvahYfm5miKEhSuVmYCpo=Z4cUdONw@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] iommupt: Add iova_to_phys op
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_083030_067478_962E94CF 
X-CRM114-Status: UNSURE (   6.91  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjoyMOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gaW92YV90b19waHlzIGlzIGEgcGVyZm9ybWFuY2UgcGF0aCBm
b3IgdGhlIERNQSBBUEkgYW5kIGlvbW11ZmQsIGltcGxlbWVudAo+IGl0IHVzaW5nIGFuIHVucm9s
bGVkIGdldF91c2VyX3BhZ2VzKCkgbGlrZSBmdW5jdGlvbiB3YXRlcmZhbGwgc2NoZW1lLgo+Cj4g
VGhlIGltcGxlbWVudGF0aW9uIGl0c2VsZiBpcyBmYWlybHkgdHJpdmlhbC4KPgo+IFRlc3RlZC1i
eTogQWxlamFuZHJvIEppbWVuZXogPGFsZWphbmRyby5qLmppbWVuZXpAb3JhY2xlLmNvbT4KPiBS
ZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4KClJldmlld2VkLWJ5OiBQYXNo
YSBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVuLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
