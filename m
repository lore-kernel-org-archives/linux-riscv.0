Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE97CCF9E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 01:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/wYk9KXA8QLJgt74RamWhD9XSTyWI8QeHNRUMmJqcs=; b=Bj1M4u+9h7AaUa
	8F/5VgiCuxFEj9Ow/6HiVsYkbwmW8KKGUAtiH6o9O1U3Ss86eTFFIYN3icig/UovYrtbzXJZfaVaU
	C9HD0B7Hp26EjL/yF+AptuxToyWwcXCwKAOnO7I68OyyLgkjBBBIhIpziiGFSaqzceUqvUVRb/zWX
	O7zB4y97v9tGSV4Qrgv72FqwHDgiHI19lWesg7C/oB3hjXCGh2bDwPFCCZvUe92Ea+wNmE/ChOm2W
	NZmAye2Ao/KF7/Y3B00sqrsRj2zYaH1ZyYFURgcCnmAd5sU0Y49/Nf76RBOydf0Qx3W412ewPcYgF
	54KyuuJ3g3c4lQqnlsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYiC-0000000F5JA-3uzV;
	Tue, 28 Oct 2025 01:41:24 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYiA-0000000F5I0-2DDP
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 01:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761615638;
	bh=+mEBbpFiHX0B6MrOl3zAV3KNKguB1G+AXghB9W8we/8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=kGlVSUEOrGkDFXHO5ca/aZBuFV2DoicFq7oU2X3RM3HVJmtaqI0SOj8DsibtNBrEZ
	 /0loprYQvfoqKUZFAtsYVsCto5r5hqoEcWVOjVsVvmbkyCoQ58fwWlm/Z2njdFchfW
	 iOCBNSosCSu+Y0cGcD0I9HzQMcKhoVcf61PQCjMs=
X-QQ-mid: zesmtpgz5t1761615636t467ae7ec
X-QQ-Originating-IP: SsILZdTTgN0uFTzov6mmR6/vmW89qEWwT3QwJkaNYT8=
Received: from = ( [183.48.246.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Oct 2025 09:40:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2958071386083091418
EX-QQ-RecipientCnt: 13
Date: Tue, 28 Oct 2025 09:40:34 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <3B5AA5AFF5C53D64+aQAfEn1OBGmevjfS@kernel.org>
References: <20251027125504.297033-1-elder@riscstar.com>
 <20251027125504.297033-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027125504.297033-2-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OSUW9vQLVhiZfSwad4tKpijbLwrG30Nc4mGcj11SCsM4vcbhjeTSl6kb
	/89I5oFsVGC3gdawGeVu3D0lMOUEpK4kogHl3m4ULQlZLi85ICM3ZCqThBOWgDt6acitykJ
	hGoBcNdB44Oi4tBST+BU3aPGmXZ7Hmd9ShMzTpx0nioFjvNoqqn2vWfvEI4TmiztHp+qF3i
	F+mQtCNmI706RtJbGYx1/PFN6hZ+3qBBV6QiSf53JHZMXwWCETlApbl0kwIq9f9uGlcBB4h
	qS/2XdAa92tv2yStZ5xkzJYyfTfll/EdU4rgonwupf2DVBoJjfteB9DF5RlpwWS+6dEQA+h
	xvh8FIHu0+TOkeKJhkA5VbxvRELF0mok3wEWU0Mi4h+dVkxYSw+pvDuYYtBaImTD3A6c1am
	W7A67T03CaiJGFu8Tm220uLS93kZpK0E1y3wAeKMOldvMwYAkIEUMDIqkCUrV7AkHsC3Yf8
	lyrZorBS3ZiHKb6XELTKJWo+7dlzW75ivXqzYsdWxkgX+JLuv1hTalA3uE/Zpj1FmTV17+p
	Tg44rhAAqWJ3PtK27EQFlDz2mL/s2oy6WN8PJCjEk1zb5o9r0CjXnhnz8/zUjAdypcovJwH
	WKoK7h+BGxFGs8IBVAY8L4+fsvibvqzRv8Zq6K1yGcX64eK7gVWV1d/c1Rix8713IBIrHsM
	RS9x7TxkyeDm7F4Kl46KYCg7WT/dDgTiGsO086DJddw/Sfm2npfQMmVJcb7SyS3zO3BLHZp
	UcWoNixF7NDAfAGbM2J68wfZXbjbjAouiOzWSpdsbZThjMMiNbEyWvWBmuYqXKQFX2hHUr0
	hndcwZenD0Y1ID+UUn8YZVMWRTE67hq3Ry7BlsS4ZV8zJeog3jni55ZWPxEb7KQnjTf0A6Y
	iY/KPrmtty2BzLcGYlLswmDH4p8n7es66fJIigDtI0TdchM+W7fgfSHTu7PPTR7TASC7HqI
	2bZ1MmUefpdltgHCpYhxMkQpecCrgZlovfDsPfiFZa00uwMEOqom9dsoSg6nyDYgIfc+eua
	nobrIqjkq3W6v5rm1wS3Dov48iWCIyoz5R0fVa2g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_184122_981042_82F29C94 
X-CRM114-Status: UNSURE (   5.65  )
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

On Mon, Oct 27, 2025 at 07:55:01AM -0500, Alex Elder wrote:
> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
