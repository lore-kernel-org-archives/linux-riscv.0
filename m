Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24B9EB7EAA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kphDAFY2IZC66I5hTk1V7KEPGlkpE2t1IRRw8Dg8fmc=; b=qsRXLgZtuhnAUT
	E0rvD2SXwNm/6nSX9bNSgGfeBAUHfsycK7qfqnsCP3hoB315AyygGl78CG5EUqKOZkE1VgE5LdL8m
	O9ZZQuhPTuFhOso7hDINnUVkUouVmn/i9KKrNkeQ4CPzmtoLC9oUeBF1w9zHz7HMEG3v/RJLHwRNq
	4jLdkV8Z+weKu8EcjLPxax2v6lXIu75ZBIbRq0qJdDcm7H+DwS73nlXX+CuWJ4ji9ivux1zrV0Uln
	HG2liN5FbsYgYdHorzrWAm7NEd5E2Krw6xD0iKsDWMY0KeCxQ8fxxMp5vvmlSbqUPADt+c/Htrs/Q
	IxyzunRr3kp/ohAkXQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhg6-0000000Gko6-3Q7i;
	Wed, 04 Mar 2026 08:33:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhg6-0000000Gko0-0l3J
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:33:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 477036132D;
	Wed,  4 Mar 2026 08:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1581C19425;
	Wed,  4 Mar 2026 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613237;
	bh=cp63Ur8HU7ilJqcOuhYKGlclOHDeaOci4wiN9pi4SOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icu8PkorEMNEeclCCIQjLqWCLTo4vgW7AO+ITcc35IIfqCT01AMBu3bcvUtgK820g
	 ABFfBni8aKVb5ViycrjzBn2OnbANKPL+VFYzjIxmx4rzAVvoGNrfUj8k5tLG0tmiej
	 k4TW4JACYBJUuaJq9kg8OAC7sQwlJnTRdx88sOW4AJSnVro2NE6C0Gw7OP4mvQmfxq
	 nMBhw9J4DjfhGKeeUzucxpApmWZvtF7zQOW7Q9/jRRL8Smy4w+PVK1+lTZfpHrmN+e
	 WmfxlBkS7bQYqk0KLfUzWhPx/YoAHqIuGeLmOr1IK4qiTTJIybbRejYF/t/6K3C+kz
	 Y39xmW+67Dy9A==
Date: Wed, 4 Mar 2026 09:33:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: usb: mpfs-musb: permit resets
Message-ID: <20260304-majestic-bumblebee-of-rain-1ec92f@quoll>
References: <20260303-backspace-unhearing-c6cc8cbddbba@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303-backspace-unhearing-c6cc8cbddbba@spud>
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

On Tue, Mar 03, 2026 at 04:37:39PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The musb IP on mpfs and pic64gx has a reset pin, but until now this has
> been undocumented because platform firmware takes the block out of reset
> on first-party boards (or those using modified versions of the vendor
> firmware), but not all boards may take this approach. Permit providing a
> reset in devicetree for Linux, or other devicetree-consuming software,
> to use.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
