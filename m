Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1A7C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyiioT5omOPr7ZE0+hI9o2H6D0FJNohR4U7UM02i0W0=; b=TDb4jRjPUebvwq
	xxyWNQ9YdJ8lhF+txxcsuamjr3v+x4RfhxNcGDQOvTyexrZW0E48xYXS0fFZPBvcrhgk5jT7VsCTg
	Uvx6VE3zkCTxt+Y+lRPplO3gZIx1BQr3PdTXB5b1aOZAN8tzwsSEaK6ctr8Ab7LujJYu8hiw/xc1R
	HEyNLwDV83jmanRHeDIUJ5JirF2x/gcxN4oIQB98/tc0w1NZTIWNCKhS+RKnk5MpcDssUK/qpjg0N
	vdFbum6/l/kTg6DwQ9GWL85JTIpdsEKrZdgK1wgvsf66g+45yUwI9lo8G0+Cuv+uz1SXUczHpqVc+
	WQTV8gqs/4Rf6cxnsxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKXF-008c3Y-13;
	Mon, 15 Jan 2024 10:49:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKXC-008bou-09;
	Mon, 15 Jan 2024 10:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BZWJhywUMRRIXvtL5doMOpnSiLPQBWG9w9WPF2MUO4c=; b=Sz3CtW8TvMYVj95XL1EZCET2A+
	QamuonxIFNT3zYkRLRtfqxw7SE6Ou+c1sDlHOm3gafCTRQqOLJZCqlQDm5FD6J4qrogV6aC9NBqKU
	UvioOgQ7gVTi/liinVC4kVe/e4buW1OQKg1r4GMXP3iDla1Qt5/Ci+N1I7TqyALOM7ZH/njEyXM+O
	kqJMAfgr9yHj6be0TqV5AqRnblBaGfn2ZJHMunrt6qJ0b7/ZJ87rjdKUjRsvXgIYphw4O44+TlX5o
	PSgdX1SN3rxuaPmO/lCvJycV2gVlF4hse5S9MWc2dj0rsOcECr0O+epZD/m8Mped50SRNjDOgOXs2
	5FXDnxHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39864)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rPKUr-0002Ja-0t;
	Mon, 15 Jan 2024 10:47:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rPKUm-0002tU-5o; Mon, 15 Jan 2024 10:47:08 +0000
Date: Mon, 15 Jan 2024 10:47:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZaUNLMvIYChv6qai@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
 <20240111175908.00002f46@Huawei.com>
 <ZaA3l4yjgCXxSiVg@shell.armlinux.org.uk>
 <20240112092520.00001278@Huawei.com>
 <CAJZ5v0g2CFPrSfNzHKBz_Spwt304QEQtR6w57VR11i5APPrD8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0g2CFPrSfNzHKBz_Spwt304QEQtR6w57VR11i5APPrD8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_024938_101841_7B5573E4 
X-CRM114-Status: UNSURE (   9.38  )
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

On Fri, Jan 12, 2024 at 04:01:40PM +0100, Rafael J. Wysocki wrote:
> In any case, it is always better to work on top of the current
> mainline code IMO.

That's fine if one is starting to do some work now, but that is not the
case with this. The first posting was almost a year ago:

	https://lwn.net/Articles/922127/

which likely means that it's been around for at 18 months or more, and
we can also see that this patch was in that original patch set. What
the history of this patch is before the first posting... only James
would be able to answer that and I feel that we're highly unlikely to
get any kind of response.

Anyway, consider this patch dropped from the series.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
