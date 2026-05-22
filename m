Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDCDCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/345j3JJR3K2BCDLOmV/oSJQPT6W7npTM3Q5QDfI1g=; b=4hb9yQmYNcGjf1
	xdUvbZoc7JxwfjiK45CQOZpyNqvLwYDM6DiGgb0+4SHetw+i0OkrlPnyKFVcaefvCUDbf7dv+WHwH
	NmYCpZgGe2zuGJPKPox+ukRURR8apetyfGQBGsZj4a8yWcAxrkvy3MoT2mUBgug260kHSAUs4rST2
	ZsOLOy95ExVxP4GWML/03khhCratqcZmfh8rhJPFhwU6QkmX8JmECaCxEQ6O3g7qBqOGIQ15kUFeM
	J9aFs/bWpeg89SPbr/N9CehfM03XRpEh8C2OdDIFSy7Yll/NvRCXV4Pe8JPOaY5MNciO10CmQYSE6
	HhQSazGxbMqeBjJAJM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQO2I-0000000AdJP-3Nuz;
	Fri, 22 May 2026 11:27:26 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQO2G-0000000AdHJ-0IwK
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 11:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779449215;
	bh=4q/myfyVbmEyFIe6+941BMQwtch6h4nWsms2RIJ1+Dg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QxTAp/nYGkFn70NXFt9qnYBm0HJGxNToTXspAhX4OI6OYl/GpLOinjUCVZCq5pxSr
	 2b91As0ZZKM3i2DddJARbmciZ/2l+rqvMrkh+T6wWSxKyV8FHpGgCz4oi3wCp7vPxS
	 +wAM0K8UUz03UHmoXLrcS5qWQJzoGYb3ZYcxFkl4=
X-QQ-mid: esmtpsz19t1779449213t87449ebb
X-QQ-Originating-IP: VyEj+Nv6piyvhL1JE5iTrnptQpzwWFWaLaZ/u8HF/Ko=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 19:26:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2874474236348965011
EX-QQ-RecipientCnt: 9
Mime-Version: 1.0
Date: Fri, 22 May 2026 19:26:49 +0800
Message-Id: <DIP63LFPHYTN.XDUDRDCPPZVQ@linux.spacemit.com>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] pinctrl: spacemit: move over to generic pinmux
 dt_node_to_map implementation
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Conor Dooley" <conor@kernel.org>, "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519-germinate-ageless-631033d22797@spud>
 <20260519-cosmetics-careless-0e9a219c51ef@spud>
In-Reply-To: <20260519-cosmetics-careless-0e9a219c51ef@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OeNW/oXGg/KmjwL+9YmKXZqjKPh0QCz9xdXXjE8pMpmVCwodNzNHiU8O
	7PgIgzgY3jbf9iIQ5uX+nkdKBriUW9ejZYeXWECZdJdugVngRjCLpqWXV6mbDlfs+7nuxZQ
	ztkn4Hz7n20Tmfc8GJMvfRQg6PFOm0N4jbVF3Eg/MWaSFmFfhpXb+XzKbJkiVyLVrya6eBQ
	JJw1PuSZlXZnR0VSiSmoy0zGrpkfQ3sXB/1FOv2emo4xZLQivI41pGJ31rWjUt+YGEO+/QG
	W0QjwvvRZRMkqxrQVjdjdXAWtv1KIfGOWhkXd0NsVzmDcucRDE62XxAS3QyCzd9fnCF3Pdz
	3n7TcIpHqHsf1TcGpMqSNhAJPtJSSuqwA1+igLWSYwqSSyTwVFuaD7XYIvgrg1A0Ke80xb1
	EjrhXGn5dD/jbt2Km1a6+2OROL/zKtej6R+aj37ZJb704aegCxvgfjR6DLQJgMVsYyw3wsZ
	6S+KukFcAaPngGMAlPTJirIH6Wt+T5prfx4HIFJ+kxG0tHMQylfuM1M89YoSQBDWd1cqQHB
	CLG12hwdmSclaJt6gYppfiSAEO2ReTLYaHvOEHM7/kAm2aY1K8PTsjdAK8Pu5V3RdrdEKGU
	QHjTFDcqNlxGQ0WRT6fv1/yUk68U2ZMpvNoxfAtbKbd4/mE6AMDGQkXZ+tQXxEP6h56ei6e
	STRhlAK2k4QnNaoCzMztSWn1WiALiTzCgzEMw+vH+Yv8eFdPE/+KLy6eCJaApWmVJj4jJX/
	aSwvAWK1qIonvP8Gnjq8HaYpxJAyLik9O1HLX8S1ba65WGXHnM2Xp8X7FVnEbZwR4DYhipD
	7Q2PBw7UCUliw361F/DMU6o6bvimlM9VabV0wmyZxDcJz3yiua3lbfnboQFVH+JrfdT4IRx
	6VyJmIKigyMlAmMK44uvHWtNueq8P6HSP8XIfhoYTfNNfjyXge3pu/A/zCeMA+qv7K3BfmZ
	638QHiabeIC5Vz/l56LRmpkdtL/0ebPMXquMS1ug6yNGceBdmYjkiwios27C7RO0llkLWwg
	n0/0IJ26lCq/+ym+ZeyLp6SleQNssahLue7ylGPsxpJ6kRnCnTmOOt4tjzMwu7wZXPONnIq
	TVugy4Zvdlu
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042725_026428_D152AEB7 
X-CRM114-Status: UNSURE (   8.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue May 19, 2026 at 5:37 PM CST, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Replace the custom implementation of dt_node_to_map with
> pinctrl_generic_dt_node_to_map() to demonstrate its use.
> spacemit_pin_mux_config didn't provide much value in the first place,
> because the group contains the information required to look up the
> spacemit_pin struct corresponding to a pin, so there's no loss in
> functionality as a result of the generic function carrying only the mux
> data in the group's data pointer rather than having an array of
> spacemit_pin_mux_config structs.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
