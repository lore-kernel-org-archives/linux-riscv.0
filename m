Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3954AD30CEE
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 22:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDaPZOv6aaYdm4APipOtX9OyctjN1GOieMs6f3tuwPs=; b=KOjl/OUfUqfXp6
	DfpdgOi+66zRFr4NG6F6kiEFPXp4idsTU0qcopm8RtmvZIP3YPX61o5r7TWaDggC4zcpuJEx8FMM2
	yKZWB8pK2jdGogpmLs3zydrOht14alqMtVfX3UTygBh3m0gvh52LiJAkXdOd4Fa3782i/zGaeuX0h
	JDhDzvSaI2JsWmWaMD+YQZme0pPDs+HyF3/OYzPY/5KBvdU2wqTgjTE8KwT/g1o8hAii40XCy9pR5
	lSdiUeIaK5u0BoUelrN3SANqUEPHvnREdSFXorwRdUN8aZdRrSdXXOnDW+INmZFZGa2ckPdH5UuIs
	jTcn6S+cvt+s5iEQJZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmqB-00000007p6k-3xjI;
	Tue, 13 Jan 2026 22:26:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmqA-00000007p6e-1fKO
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 22:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EF2B6000A;
	Tue, 13 Jan 2026 22:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B47C116C6;
	Tue, 13 Jan 2026 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768343176;
	bh=WCS1gUFqazlCTZYwN0/IDLbkTzKhRaU1clOA1skX9OI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gAjQsh2Q8Zo8IrkWVzvZOinEeTF56+8fVVF4LG6nZDqUhljjuk4hSkg+KlH3JEjBI
	 A6klso1FXuHD1841HEoboi8VO7hBqMNWkn1ypIvsX7z01Azz0jZ+BMcyZbcL/Moghv
	 F6VfWNj1vOyHOZjy0Z399rj3BOJBbw5mWJ3srJEj3Q1RfoAhCkdbcR1WikzBO5Oe6v
	 HaAC/ZUHKm3wSqqpphM2HgIQKhZDe7dnioc5xIPJUHaa1C1B0yJQcVfi3h8mKKFuit
	 BP1HYDeJOqiU3BC475n2y51T6ubFW9QkAmu76wOKBLewGGTAxSyrTrxyGOGB6OGVQL
	 W5aAezq+Sc3eg==
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Guodong Xu <guodong@riscstar.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: (subset) [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3 Pico-ITX board
Date: Tue, 13 Jan 2026 22:25:23 +0000
Message-ID: <20260113-prism-unvaried-abf3b4679e3a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dGkt94bjVYf12COX+6dHA67nfAJ4JApCVWihf8slfBY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlpx4Iz3wp4M1SZqzktZ5nzr3riytyZKtM+VhvcaM4UW /VsesfTjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyE4zQjw4VdTbFHuj64X5lZ 47Lp1K3PW1silW2KxfmZrUxUpix/4MrI8ObLZtPFV7SiqgoDbtco1Vx/ks95OF/Z66bb9oDFIZb h/AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 10 Jan 2026 13:18:12 +0800, Guodong Xu wrote:
> This series introduces basic support for the SpacemiT K3 SoC and the
> K3 Pico-ITX evaluation board.
> 
> This series (starting from v2) also adds descriptions about ISA extensions
> mandated by the RVA23 Profile Version 1.0 into riscv/extensions.yaml.
> There are extensive discussions about how to handle these new extensions
> in v2. In v3 (now v4), here is my best understading of what I think we have
> reached consensus on.
> 
> [...]

Applied 6-9 to riscv-dt-for-next :)

[06/11] dt-bindings: riscv: Add B ISA extension description
        https://git.kernel.org/conor/c/0cdb7fc1879b
[07/11] dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, and Zicclsm
        https://git.kernel.org/conor/c/b321256a4f36
[08/11] dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu64xl
        https://git.kernel.org/conor/c/c712413333f8
[09/11] dt-bindings: riscv: Add Sha and its comprised extensions
        https://git.kernel.org/conor/c/89febd6a0276

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
