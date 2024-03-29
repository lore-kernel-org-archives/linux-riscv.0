Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FEDCD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIRqzF983DrXpiERwmx6XvNhCiz5JVYYgyNKGpIR7tA=; b=lPISua67DW1/xW
	bKSXbBuP237mUjqjYdYdE4dj1Gl+0IyqulowoLAnXLY1PJS5DgIf3ZfY/RaVrKA9JgV7H2PcfvkkD
	lMfzV9g8UiCuy3Lav3z3Z0zM92AXEJCV2trWSobF62Ax6FDw1oBrm0D3kKPI6UQKjmUNaF+S2moF3
	jVVWUX5k/ieCpC0Hodc/3VubPeixuT4TANguFpYJQ7So0veodzcC8GU4v19t01TxRXEUvShPi7RPE
	cjHo3X43iY32tZfVnVvPVp3YhOY1uD0kpEKzps4v+61CG6G6zqT7K6CDUkstGMo7hI35kyzR/L32V
	3HeQgXOzCFyu2PFhhqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Ty-000000002ix-17X1;
	Fri, 29 Mar 2024 10:29:10 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Tu-000000002hX-3rFt
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 10:29:08 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-513d4559fb4so2146248e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711708144; x=1712312944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPdaKnufaKl3EzmitCsPOuEmgPAhLKf3vPPeZrNVIh0=;
        b=1tEz4E60u7f9FKoxX0LBVFV+6H2SPnxSKWlxcmm6y285bVsdtpyqdFNi1kgCecmnlP
         TZaTR9895NLjFf3bpp8BkQ5PlhKyfwgMlALB6YtbildoIDM+Lyi4z70XCxurrh5i/5/r
         F0nfUIiAMcQk/x0u6P4zGhz/VgClUXkNJOOQ+Rje/or2ER7rPybFm9HqS3ZnCpkPVjFJ
         Zu6g88hV2Fa+7qC4QGOwpvp/Ul0CKPk+TafjE7g6U+yohxy0KSGXwfnuGLUbxoG4yCWz
         jLzF1qLhHJlqjrhjhL54e+iI41fgkH3sCmZxj30p6gsQko4KxFgOf+FKZ4sD1LT0KrI+
         qQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711708144; x=1712312944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPdaKnufaKl3EzmitCsPOuEmgPAhLKf3vPPeZrNVIh0=;
        b=iQQHW82PACYjNSFTGwcZbaqxw7/leFaZGNbvIhQYPYZrxIaydHNH7PPTNBo/AMK9K0
         tdMTRGqGrTTFgmR/Xj3UjmWDOACaCC8TkRUck5NtaiNy6ciFgWIZJUncglU+vswD4MRO
         twNmsrD7Q7KiMc2DK+lfviMUhblsrMGlMWjxOYfnxMMG7clXvqrILzKaruQSjGp5aEtw
         jNMzyKmH2+HZ+IsJ4+QsrpJMGRYk4YwgZYaWGCkIR8IXeAmpFISNjLUlac74IAGYWPLe
         K/cAvt2xuJnu5861hmGZQfDubm5ZO6O+f9MLrHMZiaZ976/SdapEhKvYIrXP5XzltNfu
         ixXw==
X-Gm-Message-State: AOJu0YxMVtzTxj1YE5oKLQROwT/WiCF9mELqBqd1dooZbDxtMrXBboNM
	eomCv3K+pIhFnhRV3qPCUMflV0wSMb5yQMjJBovy1YByGZ0LUZJZqvoYwJsne0SAV/3SJxDAJ0o
	1r5qNOAHOcfSRO+VLZpaFzMJHwrNeDlxugH1QZQ==
X-Google-Smtp-Source: AGHT+IEe5xiO3f97aV+2KKvqE9B+dEnjJrnzQ+iljmH7D+HLPtwoTOdk4rILJugOJr1ig8KX/U1WYe8asoEIrRpWWb4=
X-Received: by 2002:a19:e004:0:b0:515:d1c1:c1f8 with SMTP id
 x4-20020a19e004000000b00515d1c1c1f8mr762592lfg.64.1711708144167; Fri, 29 Mar
 2024 03:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-parkway-dodgy-f0fe1fa20892@spud> <20240327-procurer-rascal-33bca7d5d14b@spud>
In-Reply-To: <20240327-procurer-rascal-33bca7d5d14b@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 11:28:53 +0100
Message-ID: <CAMRc=McSRZUfsUEQcmOs+xUnCKiTX+kEqtXmmXe71Jbh7nzsvw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] dt-bindings: gpio: mpfs: add coreGPIO support
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_032906_976208_BB9EFD66 
X-CRM114-Status: UNSURE (   9.62  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMToyNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJib25zQG1p
Y3JvY2hpcC5jb20+Cj4KPiBUaGUgR1BJTyBjb250cm9sbGVycyBvbiBQb2xhckZpcmUgU29DIHdl
cmUgYmFzZWQgb24gdGhlICJzb2Z0IiBJUAo+IENvcmVHUElPLCBidXQgdGhlIGlucC9vdXRwIHJl
Z2lzdGVycyBhcmUgYXQgZGlmZmVyZW50IG9mZnNldHMuIEFkZAo+IGNvbXBhdGlibGUgdG8gYWxs
b3cgZm9yIHN1cHBvcnQgb2YgYm90aCBzZXRzIG9mIG9mZnNldHMuIFRoZSBzb2Z0Cj4gY29yZSB3
aWxsIG5vdCBhbHdheXMgaGF2ZSBpbnRlcnJ1cHRzIHdpcmVkIHVwLCBzbyBvbmx5IGVuZm9yY2Ug
dGhlbSBmb3IKPiB0aGUgImhhcmQiIGNvcmUgb24gUG9sYXJGaXJlIFNvQy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWljcm9jaGlwLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0t
LQoKQXBwbGllZCwgdGhhbmtzIQoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
