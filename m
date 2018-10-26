Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CE0C6786E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 11:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C10D20824
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 11:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+Wpp0d+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ACQ1+OpL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C10D20824
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYKDJpj1AxVeDKVs+KukuMoX4vc6pI4196ukZvu6UaI=; b=F+Wpp0d+qSd4tt
	KjaLy5jAL8QDSym5/hYwWcE1RU4SnTvfzWJ2m3DOruyQBku+86a8eZmllMOJxEOQd1Yeyc1WY2nnt
	bVSs8HJjaKyEFh9x0YamGlWQ/8z0rfPs1PYwkyhMP41Qx9j6qhH3lsTJU+f5rzJUTIj1OwVgTIc+E
	BhLefybHt7C1Nkhg0zp/+T8uytQevzlW2XhuIa6Vk8rm6f9K+DLeQZIcmOYvax2ATiEZ/PfbaoOB4
	mpSYkSYEsw+SgU3KS9vQv7mHOLG0wt3BjSC5kRzRdiRIv4M9NRt2/7qXg5NgKDrCpTDVA815RmLm7
	sHGLA0pPoTC2eC1tRCtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gG0Zs-0008SU-5O; Fri, 26 Oct 2018 11:46:56 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG0Zq-0008SD-K3
 for linux-riscv@bombadil.infradead.org; Fri, 26 Oct 2018 11:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-Id:In-Reply-To:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xybG7KSBoBZxD7MeCojAF9dXF8FePWs2CqUmlo1e4J8=; b=ACQ1+OpL6dIfYY3LYQ8kqjVIi
 az2DVZaIo1QjsSMT/Z3mqjm0vHYfM/pEKKHTArAhNRkPA6+2XeA84K/coZgjCU8JLRK1ZpGSF65IM
 1yvCViEV4ZEQnVKHa9ndGxMiQl6orYW45QMCPXCDeCkeWszmd+Rm7KoQ4a4WiBnoLr63f6g3NVGpi
 gDHuT7VtRe+A0cPBjIPH5OQ2G1g805ZIjuWVEnTYSpN+pLmjl4SIdiA6rT4VXAzWmMG3hCEAu/TRf
 MwRFSjprCnx2sZ0He7KPN/9H7wZdhO+DmwRJ5dgT0NJhqJhZpzGiVz3e1XCzoR1kWsXs+BEoPaymR
 1HvPNfsVA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFzxx-0001bF-Bu
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 11:07:45 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9QAx7Tv077124
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 07:07:32 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2nbydkphb6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 07:07:32 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Fri, 26 Oct 2018 12:07:29 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Oct 2018 12:07:20 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9QB7J2C6947122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Oct 2018 11:07:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98C204C04A;
 Fri, 26 Oct 2018 11:07:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D24C54C040;
 Fri, 26 Oct 2018 11:07:12 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.204.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Oct 2018 11:07:12 +0000 (GMT)
Date: Fri, 26 Oct 2018 12:07:09 +0100
From: Mike Rapoport <rppt@linux.ibm.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: Cut rebuild time when changing
 CONFIG_BLK_DEV_INITRD
References: <20181024193256.23734-1-f.fainelli@gmail.com>
 <CAL_Jsq+KCOv6pXXHhHDZ+7-QUrmtMDvSjEVhK15yZ3qbnn61Ag@mail.gmail.com>
 <20181025093833.GA23607@rapoport-lnx>
 <CAL_JsqL62ttsGSbE1BS5v-mX3pKE-p_HyvuZD6nB+GUbQyetzg@mail.gmail.com>
 <20181025172935.GA27364@rapoport-lnx>
 <CAL_JsqJrMq+QHvuOsqEdCFchmXsd4s2XKUD_TboKzeEQprJvjg@mail.gmail.com>
 <1bb3bd63-a88e-b668-ea36-f0f985c0e2b1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bb3bd63-a88e-b668-ea36-f0f985c0e2b1@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18102611-4275-0000-0000-000002D426A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18102611-4276-0000-0000-000037E03A3A
Message-Id: <20181026110708.GA3814@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810260097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181026_070745_578940_3D98E2B5 
X-CRM114-Status: GOOD (  29.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-ia64@vger.kernel.org,
 SH-Linux <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Openrisc <openrisc@lists.librecores.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-parisc@vger.kernel.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026110709.yCTKIwB_rRDmQeWsP7ByDl-XETi2dZYnt4EN_CeXwSQ@z>

On Thu, Oct 25, 2018 at 04:07:13PM -0700, Florian Fainelli wrote:
> On 10/25/18 2:13 PM, Rob Herring wrote:
> > On Thu, Oct 25, 2018 at 12:30 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >>
> >> On Thu, Oct 25, 2018 at 08:15:15AM -0500, Rob Herring wrote:
> >>> +Ard
> >>>
> >>> On Thu, Oct 25, 2018 at 4:38 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >>>>
> >>>> On Wed, Oct 24, 2018 at 02:55:17PM -0500, Rob Herring wrote:
> >>>>> On Wed, Oct 24, 2018 at 2:33 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>>>>>
> >>>>>> Hi all,
> >>>>>>
> >>>>>> While investigating why ARM64 required a ton of objects to be rebuilt
> >>>>>> when toggling CONFIG_DEV_BLK_INITRD, it became clear that this was
> >>>>>> because we define __early_init_dt_declare_initrd() differently and we do
> >>>>>> that in arch/arm64/include/asm/memory.h which gets included by a fair
> >>>>>> amount of other header files, and translation units as well.
> >>>>>
> >>>> I think arm64 does not have to redefine __early_init_dt_declare_initrd().
> >>>> Something like this might be just all we need (completely untested,
> >>>> probably it won't even compile):

[ ... ]
 
> FWIW, I am extracting the ARM implementation that parses the initrd
> early command line parameter and the "setup" code doing the page
> boundary alignment and memblock checking into a helper into lib/ that
> other architectures can re-use. So far, this removes the need for
> unicore32, arc and arm to duplicate essentially the same logic.

Presuming you are going to need asm-generic/initrd.h for that as well,
using override for __early_init_dt_declare_initrd in arm64 version of
initrd.h might be the simplest option.

> -- 
> Florian
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
