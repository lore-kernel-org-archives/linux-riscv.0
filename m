Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5252C27C77
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRsxdR82nbJYN1qM7YIWA/Qrvzx4COT6KgieP+A5nUE=; b=FYH092QaVblOZi
	N37rD+xJXRBu7Gb/dlyy9H9OfV6jOueunuHlEa1ac+06PmJBUNBJuPsKEGAyuRG0gGD1DfFPju5xI
	hsAkHHFic7nOtgLBMICyWP4AJuEaRGZQD0LwDBcwoZs+fofYuC0cjO2PhbnErOCaSgHnkmY2uQC34
	gqea168YJzEvTOQeNqpPnoAaFEPajvowHmbxfsdAdjKpJnGJajWZINwiydE3nmAltWQfItOa2OdYa
	8caGO1MrKxg2zHflpn2VWFrxx+mb+GDC17tN/AwxNOntXijwVmJOjeEgnzPuaeocZaznKUvhdimHS
	w1pV3U3CFWhSlgB4IFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1pp-00000008oFV-1XxR;
	Mon, 17 Jun 2024 02:11:05 +0000
Received: from out203-205-251-80.mail.qq.com ([203.205.251.80])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1pl-00000008oEM-1cVi
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718590247; bh=n/b25ufWw2FEN1PbS/h2Gmizcmt1dbuO+3UPvLJwndc=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=fP4MeZ97kB27xyqAj6GziWZOg6hlM/kgo+kbaaMEXYqBnrPJz/D3cp9gifzm6fpLl
	 OIGJIoLtCqlT5NoyaNzAjG3Hva9tv17xb26TGwN6WbH2nGQBYh0XpU+A/pA6ySNwrh
	 1PApu9/t0+s30SoxIefub+ZVYMRErmg1/lsmmG6M=
Received: from smtpclient.apple ([2409:8929:843:88d1:dc81:b668:28ec:a360])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 2AB86CF4; Mon, 17 Jun 2024 10:10:43 +0800
X-QQ-mid: xmsmtpt1718590243t4q3vx31k
Message-ID: <tencent_6863DCC298D59097467C3E0641106D0D4707@qq.com>
X-QQ-XMAILINFO: NJ/+omVLhVgaGQOj3C9BAUFbWT0vbHZiwKhfTH3iTJpJF2/X0N+UqfrcazIqWQ
	 rpkqCcxpvCdCT7+w3b/f43Jch3pKUm5k7IE4fT/0gSkBj6jAYhWMrNEaydu0YiFKYZ8bEHXNTAkv
	 /iTyNOok9umfGcHP+8MLyVchbxR+jWfaS+pd3wcCuLgsS0joBrnWviJyMxP32H3vUVzFw4GX23+c
	 dyR/BQ2/UrlBsihDcqSZjFRoB+cBikG39chYBL3+8vIRX7pU5B6bD5qnsuN9UlZo7HHzoQcq3dRl
	 FBZ1j3zYotVTdc6t66MPzw01U8/pjMbwv1eQGS0vdE2WWKka9M7OGOKBhL3e1D9H2fisaBE81BAK
	 gHmfmQ77eoQvb73FOwKvFhs9NwwdTbMIHjaKh7HEdmUTJ6PzXcQuf1erhT8lIuxnOyxhPkZSHq/r
	 +/grkH90VGA/AumbnTndz55xDZyAjWpNtpH+aGJ3OTRXsP+z6N5am5Jz72ndPGGQGwpBT0sOfHJa
	 9REY2W1eqxufLtlCllioejHoDyRAy+VrkFQ+cZw6judnHO56Zmc52EaFBoMXEY+l55nxxJixqN37
	 3OIN6IBfySNrTn92rAUTgcQnUce5hSN/k628mPeyMHoAmcfSdV+TEjP/GzWtQ2un6wMdVZUknlGD
	 gEvROFOVhK7QkvS9hNh9HoWHIAmSOdui9ntn+OeJgRsBBBSnpndJSLsIKjRfYb5E46ZZ9WavEUCR
	 tEFO6Iw3oQ0nTup4W5sCGUiTCOWwR3tQaVCt2stVPVdlp/W3rtc4tBZ5ULCVNX6wOyM25Gi4Dyi5
	 wRHH48MLb0+SUlwOf4ZWnavP3liYQ5GwaOm12JJTKstJogAvqgFMHGQWkMeTtslVzmh2/PAdE/Ik
	 Y4O0Xgxw8NMuyPaBKdlzYDans9spx8jqVSMN4Ib8t8utqQIEX/PMcgxhyc6Tn5Bjl69VgxwW9ViJ
	 uZpVk638x0bTHR5T2vYucE8UA768wAgPQs7iPdPGI=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240616225314.GA3988639@ofsar>
Date: Mon, 17 Jun 2024 10:10:33 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-OQ-MSGID: <F59EA1B1-9DC3-40D5-AA9F-0AD72D31CC03@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
 <20240616225314.GA3988639@ofsar>
To: Yixun Lan <dlan@gentoo.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191101_785446_124FF789 
X-CRM114-Status: GOOD (  12.51  )
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



> On Jun 17, 2024, at 06:53, Yixun Lan <dlan@gentoo.org> wrote:
> 
> On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
>> Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
>> 
> .. snip
>> + uart0: serial@d4017000 {
>> + compatible = "intel,xscale-uart";
> are you sure the uart IP is fully compatible with xscale?
> otherwise I'd suggest to introduce a vendor specific one..
> 

Sounds like a good idea. I will add it soon.

>> + reg = <0x0 0xd4017000 0x0 0x100>;
>> + interrupts = <42>;
>> + clock-frequency = <14000000>;
>> + reg-shift = <2>;
>> + reg-io-width = <4>;
>> + status = "disabled";
>> + };
>> + };
>> +};
> it's better to also add other uart nodes, I feel it's more complete
> 

I should test it before adding them. However, if I remember correctly,
there is only one UART on BPI-F3.

> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
