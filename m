Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D317F33A72
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOBt+Po1tI1hpfmEE5jQXj2u0dRbIG3TboscpwfzkP8=; b=B29UyHy2f8nUQh
	onJEP213u6/bDs+/yAf3xZJxiE9ErQd4USBVcJMitSGUKLH77B4IbWJUpnKyUP5XBVUJ32X7L+qfG
	FA3oG46FJB0WOoDEX/poF5apsyB/zRO8bXSYQjB3s3PqPT9b98a+eZPx9JtKhiJv2c8h4zF4HdNUg
	QbNfjiduuialEJQ9KE3GtgxBN410sVFtKUqyhLtesDPJDQdSL7nQ/ZbgF9xIXkuy1YT8C6cpmKqZC
	jJmaB4ClT35+rBh0GiNnNHpAxKjpNJtNcF8JHrd9X7291irc4tzX2HvHN/y6hUprOzJ98s2Idhugu
	k4P8Salz907sKsNN4Z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9Yi-00000001w6Z-0XKy;
	Thu, 05 Mar 2026 14:20:12 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9Yf-00000001w66-0mJ9
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 14:20:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772720394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iChzT7an4CDA50iO2J/RWK6/rLetlJ/sHiZSMdW2V6DJA9YoyQ/ciYwXoi5ZeuWbPiABf6oEZ1hynyjiskc8ekUUjHgcUU+FWrhBSRN7P5dHm4YaMMrXq3RBrVLCu07daNg8v7i5vYxVFvYqve0a8vqUpNftw58YjjEgH6l9qUA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772720394; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8EH2Wdz/ApHNOs3hATivokwXwEicdZ6f1t/bCh0wnPc=; 
	b=ajrciUiaY7yKwnFzPePJEZ/e7kf69hnwcLiL/RL2yVA+H1PeGwnZHumQrYrUol+9+q7pCnj3X5kypqfUd5ZkHD4xVXoH03JDBvdNPEedkM+PDZVKnKyDlnib0RHUHeJSUe6vRC4jjUBbg/0n3pe6Q92gPskr/PIf+aMFVZWQBnE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772720394;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=8EH2Wdz/ApHNOs3hATivokwXwEicdZ6f1t/bCh0wnPc=;
	b=NZYJo+ixpOXK6Jsfb8yZWAb1aSXJI0cN/r2Gmi+N+yEe3ueDX/IIv79RibIKudyG
	xuisfH5OV3PqlB3WamjouJl6m8s0AjwAGozuCPIFPSrOPeIrMCOB0gJe0gZIwC0GsFP
	KDbx4CR5goFQYjMOKTADEg8wJB2Ybz0+DIUAw9LU=
Received: by mx.zohomail.com with SMTPS id 1772720392171171.00297458267767;
	Thu, 5 Mar 2026 06:19:52 -0800 (PST)
Date: Thu, 5 Mar 2026 14:19:37 +0000
From: Yao Zi <me@ziyao.cc>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	"rom.wang" <r4o5m6e8o@163.com>
Cc: linux-kernel@vger.kernel.org, Yufeng Wang <wangyufeng@kylinos.cn>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: acpi: update FADT revision check to 6.6
Message-ID: <aamQ-Xdfuh6PramC@pie>
References: <20260305091433.83983-1-r4o5m6e8o@163.com>
 <f4ba06cb-a0d8-423c-b1bc-0257625eea00@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4ba06cb-a0d8-423c-b1bc-0257625eea00@canonical.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_062009_274796_251C38C2 
X-CRM114-Status: GOOD (  28.23  )
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

On Thu, Mar 05, 2026 at 02:00:50PM +0100, Heinrich Schuchardt wrote:
> On 3/5/26 10:14, rom.wang wrote:
> > From: Yufeng Wang <wangyufeng@kylinos.cn>
> > 
> > ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
> > tables such as RHCT (RISC-V Hart Capabilities Table) and
> > RIMT (RISC-V I/O Mapping Table).
> > 
> > Update the FADT revision check from 6.5 to 6.6 and remove
> > the TODO comment since ACPI 6.6 has been officially released.
> 
> If I understand the change correctly:
> 
> After the patch QEMU v10.0.0 will stop to boot Linux via ACPI.
> QEMU v10.1.0 will be supported as it indicates revision 6.6.
> See function build_fadt_rev6() in qemu/hw/riscv/virt-acpi-build.c.

I don't think so, this condition only decides whether an error is
printed as firmware bug when the kernel encountering pre-6.6 FADTs,
and the rest boot process should remain untouched. So it in fact breaks
nothing.

> For Ubuntu this is not an issue as it is on QEMU 10.1 on recent releases
> (https://launchpad.net/ubuntu/+source/qemu).
> Fedora 43 also has QEMU 10.1
> (https://packages.fedoraproject.org/pkgs/qemu/qemu/).
> Suse Tumbleweed has 10.2.1 (https://software.opensuse.org/package/qemu).
> 
> Stable Debian Trixie using 10.0 will be impacted
> (https://packages.debian.org/trixie/qemu-system-misc). Debian Testing has
> 10.2.
> 
> Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> 
> > 
> > Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
> > ---
> >   arch/riscv/kernel/acpi.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > index 71698ee11621..ff681db9f4f1 100644
> > --- a/arch/riscv/kernel/acpi.c
> > +++ b/arch/riscv/kernel/acpi.c
> > @@ -85,12 +85,12 @@ static int __init acpi_fadt_sanity_check(void)
> >   	 * The revision in the table header is the FADT's Major revision. The
> >   	 * FADT also has a minor revision, which is stored in the FADT itself.
> >   	 *
> > -	 * TODO: Currently, we check for 6.5 as the minimum version to check
> > -	 * for HW_REDUCED flag. However, once RISC-V updates are released in
> > -	 * the ACPI spec, we need to update this check for exact minor revision
> > +	 * ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
> > +	 * tables such as RHCT (RISC-V Hart Capabilities Table) and RIMT
> > +	 * (RISC-V I/O Mapping Table).
> >   	 */
> > -	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 5))
> > -		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.5+\n",
> > +	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 6))
> > +		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.6+\n",
> >   		       table->revision, fadt->minor_revision);

Here pr_err() is the only statement enclosed by the if.

> >   	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {

Reviewed-by: Yao Zi <me@ziyao.cc>

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
