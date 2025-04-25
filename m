Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3552DC369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8nIcl9zgdFMv3LtW64Ol0rdE8uxrJg3qhlplgldhMk=; b=4uGo9WdwXXD/O3
	fEfEyOzNvjPoeWv+bSBSUfnI6SguYGvTtuglXOGgI7GlqZ0eC9eUtJ+k0NBzZlLhLmlv1T1L2AGSK
	nGaH6poSyM15trjqOk9w2LX95dC2odji2542mh/QqWYeMbGHzLmffbI/Emt0HB/TAnMIqq8rF0h+s
	kbNQlHCHf2EZRRPER1xPnECcWe2TJrb/C006VZtYFuATHYUM0dmzC1GIisA+UZdh+WOTnXWkoR8NE
	h3YsCQgfrNtAlpF6LVu0RO+Z9lcu2joNTfzRZdLrABiyy4H9Okyy14rltOAkbYDruMHFQiJsOt/35
	XcoeAfzMwLgkrYzsrRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KBI-0000000HSjb-0fhR;
	Fri, 25 Apr 2025 14:37:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Idi-0000000HCcE-20Tn
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:58:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso14888985e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745585925; x=1746190725; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h32MpWGnGgpxDT6AyOuIJQcbaczCBtPKdaZ9N2BrcSA=;
        b=TylzLSPCHxvZr7e3dtnAaK0zhk2FFLz3LcU+rKAEU8v0/OE0h/MhfnVADMAo5vv71k
         Gs8Vj2wHvKBN4Dy4xEeeGS5ObS7Uj1GJhwbqw3dZ1q3jv20Gv0PqXrsZPlzX4tW3miZO
         eZFYKN9TLR7e2zA5/c2/xR0I19KuNQnzS9oNX0F1uYgfviVMCCcym+SZbBbViPV2VPrb
         WjaLdv50VKluTvyBFe+eEmpUne7LoY3xPuG8N8w7og3Tw1lwzZDAoTlGhwWXmWR0NSXu
         YFDoLAXBH4MNmsRIITre5eDVhPfY3xebEBojnXi3rX+i6QQ9ERilo4CxfySiy7x3Mz7/
         nLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585925; x=1746190725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h32MpWGnGgpxDT6AyOuIJQcbaczCBtPKdaZ9N2BrcSA=;
        b=iHnBt0DcvNV1nrlK3/ANdrU2GxpNZgcwkIaOVouiLiQg9NRtL/hAq0lRVw48WOP1/f
         3p1dIbK4yztMkicl536J1x/5LaRee26HxFInmFdCHoJZ0HQoaycWxFrjbsoym4HweUJw
         4+Gad3h/tM8RU1iCBJbK+k9cQDEO5yigEtOOFXOzLe569KLjiwNYRswqN6Jn+q/DBmp8
         ssVi2HxhlZ0jnWLFk77vOF9n0yPHbNbO9QqQ6lXjRTJthz/yjS/nnlhYoSn63tXiL86J
         EiwRVVKLOoSTgcOsaOYyTILrv52sCxFS8pTkDRhiUdJlvfVFcujd0dm8TiMxFrVC0K7K
         xdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPXWIRJAq7lw2KdM3zz6zSJqhy34T6w8LfBT2jX9RzJ1+iD8RgM2idq1L3T1smMTSDSpZH4F3peokq1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3OkMODYLzefydmoZV9esxIrIx7VBE82mIP12Xrqpquv7v0o5
	SvIpD/25qRGi37eDqYw9V1+ytiLjcKX9C1NDNB4zHfokyawLhK1nT84jagKwNFI=
X-Gm-Gg: ASbGncthVL7L7MQX+ClPb2dYAiceby+w38IJaN5lswk/w6MtpH0VgMC+12b0LT11fs9
	6LT9dds9WgSobcziqjs5ryEW4DPgMyojS+581gukElkmjAmuJ7L+AYE3fh5uXaQJ2YhuSPZxZGw
	1FGT5EP+7ZhtNhEYJfoL83wedC+0/w1dYxPI5yGupXnxsDsYUvyv2iIqz7+e+tc9/C/mcwWLpqH
	2lEOs20vX1llp2DFy9BqshmTCoSM1qxYMO/NtPc7nv5rNqj3lkTBcdC7qrQ5z/WRZcyvTrg2qWF
	KjI0Q1xswAeIGF4HJhqDfnsJNJI4
X-Google-Smtp-Source: AGHT+IH1o3+pe6w45uhSEWnsxZ3kyB6TJbP2MLFTmjrjISo8GMvqrB42OloPKpF+TK2iDyjwzSvPYQ==
X-Received: by 2002:a05:600c:1e0b:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-440a65e2c51mr21114245e9.9.1745585924890;
        Fri, 25 Apr 2025 05:58:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cc1sm23902615e9.32.2025.04.25.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:58:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:58:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Message-ID: <20250425-65f6d6913f9f621dbc8c4479@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055846_514044_DFB013DB 
X-CRM114-Status: UNSURE (   9.10  )
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

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MjU6MjFQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IFRoZSBzYW1lIGNvZGUgaXMgdXNlZCB0d2ljZSBhbmQgU0JJIHJlc2V0IHNldHMg
b25seSB0d28gdmFyaWFibGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaS5oIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgICAgICB8IDEyICsrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20u
YyAgICAgICAgIHwgMTMgKy0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9z
eXN0ZW0uYyAgICAgIHwgMTAgKy0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxh
am9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
