Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7985DC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDV3tQkofa2GTxZx+V3A3rHmgvmTOMiUya1h9k7wCI0=; b=nXWwlETgTwhnZ2
	rohua8D/xBu3CrTqTHI57nEDzizV/e8n0e84h79W5PYdwuKZY5daTpJ8XQ+brfa1sTTJQ5Ou/oHK6
	IPApOTj+3rjHn2LHzYPvXFhmZw8K8AjCNO+YejRWZxVmBriI8XQUOd0AGZGAdxsxD50Vy2OiI9/V3
	sNDgNZMQ1QPcDPTnOf3qkKya8VHdNTjULAodzPOS7BPmubevhOQ72nZmdzzCBPu4YhncXSAKgUimR
	DUcNW/TWiVT3vIih6kmkeAIQMfnD8Ycr9sD3g3jCCW4EwyqFstrQYiyKAF+cEkYaS4C6GJauwBel7
	lSSDMzH114rZ/rCIoCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdbv-0000000CFbX-03f2;
	Tue, 14 Jul 2026 13:55:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdbr-0000000CFaM-3bgy
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:55:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso2909936a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037340; cv=none;
        d=google.com; s=arc-20260327;
        b=H2+IqaIvWrc3gYckiVav1tiof/r9UXAxPJNY3OcicvI4doA0iEwCRybgi2ZUfrgnSM
         vZmgu4TNSC0JW9yFXX0s+5F/fx2kCJfxfnkllsG3bteVuWloFry9hF0hCRVsqwaJZ6JY
         MNYRzMGH3+um6TNrdkwinyqhwtEBxrAaVjc9fSrbQ6vEHqIBpNmP1fefmu+MYa/yA624
         vWCM6lrNbWQ/4zR3V7dZaofzPiVvmnqclTc2U21LkgT778Zon6vz5sBYeQLgZ5bvfe8i
         L72oBzgAeCmljbzPlWDM+FjNl21NpM1FinP10qsi/apdVAJu7XuxGtrXfBU3EB1ykNKd
         tZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        fh=8l7fb+UIocXUSOnX0dw+UiMyS4FKRbBZfgBqRGKABfw=;
        b=dvZL0pJShuSd+r8WPhqvOWpicGRwt+IS2WZ8WWBNjQKn3mCPkCBuP/gmfDU7J8b9Ua
         PXwGafvZSAy1bBXcj57VRW8aJNdrBJlO3MooFQjA/y6nys2O5P2c9fruFeMTGoAUeQN7
         Qk5ZKd499CIdhsbIb2FsG3AzNS4ciUa5ZqvJpwL1eaB7wxn84c7jVTvtDTJPxrNpD0dJ
         9JZ2miZ6gdQNhmvphG971hUZkn3PMjS4faxYgl/SUaWaqvA0pUMef6v2TEzZ1bd2P0m4
         EgWa5jugDFPBd/aG1yVZud4/CDrZBTPW1Ollaoxl5TPLOc6BsGovalgnmauWOS62lQTN
         aD2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1784037340; x=1784642140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=T9s5qowLxy4cwpR93Pkcx5I6qxPCpY4W9J5z4bUwdtdJ3n0sovYsE4RoiPB/fZWGlO
         vVKdVhTZtRbjzCp6ONKO6JTsh9BLlbkv/bIAPobqVyF4FliJ/Y/V7ndIK9y5javybSUK
         cF+9/S6ANwjWaRaKHAmCAz7sFSCzsdiRgIyew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037340; x=1784642140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=o6UZYDe2LPquxTl8OJMZaOeFhppbZRTWLkwBMwyiIkvqS+9LMOYIQpSvGB60XAxq+t
         tjdI826HWYhsRllXI919Lr6VkqzSzeJw6MWEKdpcT6Wf+RRQf9Zn4UFyCuCpVjxM3cVp
         bl3vl36eHwogLdSpnY1jCfMm2xcZhGhYpMHzjBEw5JfkEtbDoJFjpZLIwDZ9pigXbRjB
         TRxpyMSw5CJ8IxrQmQXKk9KO4FWaRQ7KdsI0Bcvx6XoAlHncQnCIVkDSATiN7Fc4Ub0z
         IgWaeb1ycXVPtYy4NNCot0as8WHVC6+GJZHw8f/wa3AsTP0qAei4PqSGHIPsdlIWfO9M
         7/Sw==
X-Forwarded-Encrypted: i=1; AHgh+RobYWTPwLtCUaO8JFPpW8YaflOHHai22k8veoageJzq2eccZXhwRSYcWec5gJvIvbbZnG/Pod43YxjvAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw32V+48u+3hP4NDiU+DlwZkrQ9//AMGjEQqd98H3OJMPuRF9nD
	ByGyDWihE0BOw9TDnw/a8gPGSpEDCbWph/4CqvzR8aZ3W5Fy9Q5ufMQxuTeXfVXe/1fZgJMsdz1
	0VR3NWI6Nb8ixrfzzxaEVXjkaManV/jn7DO0QAQeLCA==
X-Gm-Gg: AfdE7clCrGR/zfapEgBNjCOnRmF7JKZzMo8fg76oQZHOVd72Cl58GcjiZfVOSUislmC
	QmkVO74/26ljd8puA7s+ioNy2Ry6bVkKXtkez4R8qUR93zOMIxboULfZoRYGheAYurgYMM6W7LH
	d19QqGGlyLoUlUSU1u1k4aRkg+fx76+ewKAxK43bIOGMPhkPwAtQThbB4Jb9NjoLAkr6i3LoZOt
	GC6nZjIbQcYSGUHYiV0FIqqZLm0VNNbbukG8pP+l4u69cXf4f5d57aa0VmxVr8AWoGLPyYvJmHN
	pfdlvfh/M6u2ZF97rusqa7qPa3lJvqs=
X-Received: by 2002:a05:6a20:450f:b0:3c0:9c19:65a8 with SMTP id
 adf61e73a8af0-3c110a30fb2mr14802853637.64.1784037340342; Tue, 14 Jul 2026
 06:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 14 Jul 2026 22:55:28 +0900
X-Gm-Features: AUfX_my4HWQr0GTS92czUivB5kzuMCNXDtWp5XUMf9HPpLFf89A5CuHvz5fm-hQ
Message-ID: <CAFr9PX=UE0OtdR+XSZShPXUp9BSL=NN6tr_CSoyNPSxzdLa3nQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_065544_136107_F64CFF9E 
X-CRM114-Status: UNSURE (   8.51  )
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

SGkgVXdlLAoKT24gVHVlLCAxNCBKdWwgMjAyNiBhdCAxNjoyNSwgVXdlIEtsZWluZS1Lw7ZuaWcg
KFRoZSBDYXBhYmxlIEh1YikKPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+
Cj4gQSBkcml2ZXIgbW9kdWxlIG1hdGNoaW5nIGRldmljZXMgdXNpbmcgYW4gb2YgZGV2aWNlIGlk
IHRhYmxlIGlzIHN1cHBvc2VkCj4gdG8gZGVjbGFyZSB0aGF0IGluIHRoZSBtb2R1bGUncyBtZXRh
ZGF0YS4gQWRkIHRoaXMgaW5mb3JtYXRpb24gZm9yCj4gc2V2ZXJhbCBkcml2ZXJzIHRoYXQgZmFp
bGVkIHRvIGRlY2xhcmUgdGhlc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncGlvL2dwaW8tbXNjMzEzLmMgICAgICB8IDEgKwoKRm9yIHRoaXMgb25lOgoK
QWNrZWQtYnk6IERhbmllbCBQYWxtZXIgPGRhbmllbEB0aGluZ3kuanA+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
