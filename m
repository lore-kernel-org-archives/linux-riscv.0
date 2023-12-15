Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B7EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/2Mb10/eBhxSzBn53zXyJg0OgwQ7Uji02iJNBtEFG0=; b=mem5EPGjwKPgSu
	CVBlpnTL6BRLO29ttZWBOe6nUND3Vljc5UgPZHHirW9Fb+6eRUu4cLKAlUBzQTlUP8jEvk+CAAGiH
	5jyNnuVlXFdjIaYekduEC5xFel33rmh0XnBbJzhjoXDofn4isDbFVgw5KsPRmVaiNfCbsL7fos7E2
	JSE3K1eW6P6N18vlQyS+9R+HF7w9Cg589UlFhm/kM5Fy4ygWEu6I+n0+aZcrTVe6wz0Hb/AzQU45P
	zJIrzmYJbf8QBhpWE8sj2538IcLqbU1zdj1oNz5VyYchTw5YA77+HPO322SgiwsDIJdEm75fnXwnw
	5QHZk8LuDEclrb4YxrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEE2z-004MyI-32;
	Fri, 15 Dec 2023 19:40:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEE2w-004Mxl-0k;
	Fri, 15 Dec 2023 19:40:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702669228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=py2PeKKW0Gg3Y7O2QlrezYfuYNsNwRB8EFj8qodJKBQ=;
	b=CdG5taBAB6NTGzrM1rVvHjEwlby6utivd6CtHCQ/SbU/I0bckLsyLiBKkgFxHtVPownMHz
	5T8olK/qGeNpaRlM7L5jERG1xMONRGfJKovMfz/HsRMtryBgfVSSBp146avw0XqPAvs+hd
	1VajQ9M8qfvAEi+x7fpa/LbJRNsPoTBneTU2l0pCSv/fG28o4g74Ia0roq11PfKpJym18J
	2CJ1VF0FxfTwZppVnajmd6+9Q20FqIdDBs9Zk7N2tnUgdmEbq2b4x4ujKF+vDauHDKUNx2
	ktWw7oS5G8SIUH6h9kxMTknyF6WlsYPA+KTBwbzdtkMoMD0gpOTMeFvPV0swhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702669228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=py2PeKKW0Gg3Y7O2QlrezYfuYNsNwRB8EFj8qodJKBQ=;
	b=AkWe3gTm8O5beIsABX3PYEheunlmtyOLR3tMy+HnIHu9N4zr8/Q64ZQBWBzRCznskC2rHp
	BwvqYKEXsjJzgQAQ==
To: Russell King <rmk+kernel@armlinux.org.uk>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev, x86@kernel.org,
 acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, James
 Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 21/21] cpumask: Add enabled cpumask for present
 CPUs that can be brought online
In-Reply-To: <E1rDOhX-00Dvlg-Ci@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOhX-00Dvlg-Ci@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Dec 2023 20:40:28 +0100
Message-ID: <87le9vmez7.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_114030_412176_2AF46015 
X-CRM114-Status: UNSURE (   9.89  )
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

On Wed, Dec 13 2023 at 12:50, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
>
> The 'offline' file in sysfs shows all offline CPUs, including those
> that aren't present. User-space is expected to remove not-present CPUs
> from this list to learn which CPUs could be brought online.
>
> CPUs can be present but not-enabled. These CPUs can't be brought online
> until the firmware policy changes, which comes with an ACPI notification
> that will register the CPUs.
>
> With only the offline and present files, user-space is unable to
> determine which CPUs it can try to bring online. Add a new CPU mask
> that shows this based on all the registered CPUs.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
