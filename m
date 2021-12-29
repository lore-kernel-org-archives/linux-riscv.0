Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D53C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBREVV3oCTNSARoO/z9wa4SrpklMJU+sQ6UqomN63X4=; b=PbrVM/YtSrfrsJ
	3RQ7/W8zj42y8SYMIq+7yJz1qKORDjbfkdH06daO7gLhSx3SpIQlp2sbPr2vDA7JIsBZxbq1OXp2z
	vcb0O7ioZHbzdBzMM8WLy7qj/zSMVDF2h0mYJoeeN3MTLRnDXkULRq/bk1zCY/WwtV4FzPIKhgtc2
	p4CrH59/NrSH+ydgTzIXC4NAUND5hiFLf9QQ2cwZA99B2Y7h2LFoJCII4TG8xpidNkthe4qAo0ESx
	jP0IymERxlx8SN0xNxslaBxv2ZXbpsq/ABjU9LwWH5y8S/TrYzAvX+zEMu6aJ3UVRY2MT5WS4NVOI
	IvH9yMNwxbehTQuK1hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2cFE-003AL3-9s; Wed, 29 Dec 2021 16:56:08 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2cFA-003AKa-LW
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 16:56:06 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGGDG1021094; 
 Wed, 29 Dec 2021 16:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HdnyGMrNQq5HwcD3rzBtNwXECdRLAC9GX9P+kQ/Hjcw=;
 b=oT2HFLoYLALLrgLRwtBRMZXCgWQFcfQjBbK0K+caJ77P7afo14raOJ1vW9Vweuu6XtCp
 wuQr1EpptRhTDBIoBrmICvNdhuaxhu1Fls7UFvGfjU1amV+wG1zlwhIozvnTs2F03voT
 WqTwe95fNNvSDJRbEVOoog7uhiLjj1JTCbS1iZ4wTARJpGR5/pGWDoNuKQ2sPmXRH6M/
 9+0TRklovx+KPOtfpBNyqnOAP/rcVRHKJnipmA6IDgCmhhZFwJBIDJuF/CjHM28/3JKq
 ZyHfd6RUYNESg9Su+bSyQf54G8QOgTFjc1UvOj0CmMcBXOsWbUSD/DoeJr6BQCxu/3kN 3w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7uscu8mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:55:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGmLTM006232;
 Wed, 29 Dec 2021 16:55:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3d5txayr16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:55:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTGtedQ36241732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 16:55:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC9014203F;
 Wed, 29 Dec 2021 16:55:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B22942041;
 Wed, 29 Dec 2021 16:55:34 +0000 (GMT)
Received: from sig-9-145-13-177.uk.ibm.com (unknown [9.145.13.177])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Dec 2021 16:55:34 +0000 (GMT)
Message-ID: <e0877e91d7d50299ea5a3ffcee2cf1016458ce10.camel@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ettore Chimenti
 <ek5.chimenti@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, John
 Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, Greentime
 Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Damien Le Moal
 <damien.lemoal@opensource.wdc.com>, Ian Abbott <abbotti@mev.co.uk>, H
 Hartley Sweeten <hsweeten@visionengravers.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean
 Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Karsten Keil <isdn@linux-pingi.de>,
 Sathya Prakash <sathya.prakash@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani
 <suganath-prabu.subramani@broadcom.com>, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Kalle Valo <kvalo@kernel.org>, Jouni Malinen <j@w1.fi>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>, Kashyap
 Desai <kashyap.desai@broadcom.com>, Sumit Saxena
 <sumit.saxena@broadcom.com>, Shivasharan S
 <shivasharan.srikanteshwara@broadcom.com>, Nilesh Javali
 <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, Mark Brown
 <broonie@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy
 Wang <teddy.wang@siliconmotion.com>, Forest Bond
 <forest@alittletooquiet.net>, Jiri Slaby <jirislaby@kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-wireless@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-spi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-watchdog@vger.kernel.org
Date: Wed, 29 Dec 2021 17:55:33 +0100
In-Reply-To: <20211229160317.GA1681139@bhelgaas>
References: <20211229160317.GA1681139@bhelgaas>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VatiC04_l2YsX43jEhVm7dn2C2d413bh
X-Proofpoint-ORIG-GUID: VatiC04_l2YsX43jEhVm7dn2C2d413bh
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_06,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112290088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_085604_724225_53F82AD1 
X-CRM114-Status: GOOD (  42.02  )
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

On Wed, 2021-12-29 at 10:03 -0600, Bjorn Helgaas wrote:
> On Wed, Dec 29, 2021 at 01:12:07PM +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 29 Dec 2021 12:45:38 +0100
> > Niklas Schnelle <schnelle@linux.ibm.com> escreveu:
> > > ...
> > > I do think we agree that once done correctly there is value in
> > > such an option independent of HAS_IOPORT only gating inb() etc uses.
> 
> I'm not sure I'm convinced about this.  For s390, you could do this
> patch series, where you don't define inb() at all, and you add new
> dependencies to prevent compile errors.  Or you could define inb() to
> return ~0, which is what happens on other platforms when the device is
> not present.
> 
> > Personally, I don't see much value on a Kconfig var for legacy PCI I/O 
> > space. From maintenance PoV, bots won't be triggered if someone use
> > HAS_IOPORT instead of the PCI specific one - or vice-versa. So, we
> > could end having a mix of both at the wrong places, in long term.
> > 
> > Also, assuming that PCIe hardware will some day abandon support for 
> > "legacy" PCI I/O space, I guess some runtime logic would be needed, 
> > in order to work with both kinds of PCIe controllers. So, having a
> > Kconfig option won't help much, IMO.
> > 
> > So, my personal preference would be to have just one Kconfig var, but
> > I'm ok if the PCI maintainers decide otherwise.
> 
> I don't really like the "LEGACY_PCI" Kconfig option.  "Legacy" just
> means something old and out of favor; it doesn't say *what* that
> something is.
> 
> I think you're specifically interested in I/O port space usage, and it
> seems that you want all PCI drivers that *only* use I/O port space to
> depend on LEGACY_PCI?  Drivers that can use either I/O or memory
> space or both would not depend on LEGACY_PCI?  This seems a little
> murky and error-prone.

I'd like to hear Arnd's opinion on this but you're the PCI maintainer
so of course your buy-in would be quite important for such an option.

> 
> What if you used the approach from [1] but just dropped the warning?
> The inb() would return ~0 if the platform doesn't support I/O port
> space.  Drivers should be prepared to handle that because that's what
> happens if the device doesn't exist.

Hmm, in that mail Linus very clearly and specifically asked for this to
be a compile-time thing. So, if we do want to make it compile-time but
keep the potential errors to a minimum I guess just having HAS_IOPORT
might be valid compromise. It gets caught by bots through allyesconfig
or randconfig on HAS_IOPORT=n architectures. Also it has a nice
symmetry with the existing HAS_IOMEM. 

>  
> 
> HAS_IOPORT and LEGACY_PCI is a lot of Kconfiggery that basically just
> avoids building drivers that aren't useful on s390.  I'm not sure the
> benefit outweighs the complication.
> 
> Bjorn
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> 

Despite s390 I believe it would also affect nds32, um, h8300, nios2,
openrisc, hexagon, csky, and xtensa. But yes none of these is any less
niche than us. I do wonder if we will see a new drivers using I/O
ports?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
