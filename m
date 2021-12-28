Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8438FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMZ6ii4xz5OsAb0XheHscjLjJ6GoFhD6TRzrSCWplXw=; b=zSdp2vyafxt/qy
	pWU8TutpxsksLnZkD9J8JlVhDk5nKqtsHV6cXcKpYT4JbCxL6//C5a05A19+KaR67+DwU19WOcCUX
	wloEt79CI9JGUwN0HdF5kMdAM0uCxzlgI3SOXoeyZ3oEkVXSQpBYNBEiuQ+laHX3+4IMPHP3VMo7n
	BtHqVhW5eOGp2J3k+VhyoDRnoXhT2RQdbff41dIeggO5nO3rvip45e2IqntmDQWH3Ace/xppOolVL
	R+W0f6LS7yxSb8mfGYsDQHtFTTXeDHROB6oU+iMY+Fn2GCWSGMKUS77jgFZICtN0JmBPra3nx7m1Z
	oUr2wFydSklm0PjyR51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ENf-001RIP-WF; Tue, 28 Dec 2021 15:27:16 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ENc-001RHU-OE
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 15:27:14 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BSD7W5Q027040; 
 Tue, 28 Dec 2021 15:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=OPN9EGb1cKoGPioLIRhjXHHm5AxDtIn8DXUn9PWgz5E=;
 b=ZgcXj67lIf9WShWDBL9Fm03vEit0/Ttfs84ECHKmCOPrquKz2uhwpIterbNWRFd0Kxaj
 cnOnOi/q/KqkwZVTur6lgV2Yt4jaVZAU8/iR+1GDCeFPOoHv891n6nPqxfHMxqLHwu7y
 WRUMXuQzVMkmOL/H6vOUXNkenfQTgGM6CmgjD8nVKmpjNNPoSd3KTuvpxgAadVgr9pma
 REDidR1o8qER0LiCt8d7e9DJQazzQqgdX3C3P3AFaFoKOI9w3mYSJel8UW96SIDN83LW
 w7CtQjDiajVkRyPwprxowQ5X/M04Dcp9FepRixmxFdCFLaBCNTIR0vxxb/iNYRswq1ym lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d81g64r2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 15:26:47 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BSE18H8028048;
 Tue, 28 Dec 2021 15:26:46 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d81g64r1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 15:26:46 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BSFMmgT014020;
 Tue, 28 Dec 2021 15:26:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3d5tjjg9b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 15:26:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BSFPRnj39911848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Dec 2021 15:25:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A3174C040;
 Tue, 28 Dec 2021 15:25:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CE724C046;
 Tue, 28 Dec 2021 15:25:26 +0000 (GMT)
Received: from sig-9-145-12-118.uk.ibm.com (unknown [9.145.12.118])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Dec 2021 15:25:26 +0000 (GMT)
Message-ID: <6b719d661f9ba7a23776b00a2f250d14cb21bafa.camel@linux.ibm.com>
Subject: Re: [RFC 28/32] PCI: make quirk using inw() depend on HAS_IOPORT
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Date: Tue, 28 Dec 2021 16:25:25 +0100
In-Reply-To: <20211227223348.GA1545446@bhelgaas>
References: <20211227223348.GA1545446@bhelgaas>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SlzhYlcAKu6htNFJRfi2in5vyXvNgvZ9
X-Proofpoint-GUID: idbkDC718D3c8LYHtdc5XXv9V6EIaWQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_08,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_072712_950302_0133DAFA 
X-CRM114-Status: GOOD (  26.60  )
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

On Mon, 2021-12-27 at 16:33 -0600, Bjorn Helgaas wrote:
> On Mon, Dec 27, 2021 at 05:43:13PM +0100, Niklas Schnelle wrote:
> > In the future inw()/outw() and friends will not be compiled on
> > architectures without I/O port support.
> 
> This commit log actually doesn't say what the patch does.
> 
> I'm pretty sure this particular quirk is x86 specific and could
> probably be moved to arch/x86/pci/fixup.c, where the #ifdef probably
> wouldn't be needed.

Will look into it, that does sound like a nicer solution. Thanks!

> 
> If we keep it in drivers/pci, please update the subject line to make
> it more specific and match the convention, e.g.,
> 
>   PCI: Compile quirk_tigerpoint_bm_sts() only when HAS_IOPORT set

Ah yeah I was going back and forth between matching this within the
series vs matching the subsystem. I guess going with the subsystem is
mote important long term.

> 
> BTW, git complains about some whitespace errors in other patches:
> 
>   Applying: char: impi, tpm: depend on HAS_IOPORT
>   .git/rebase-apply/patch:92: trailing whitespace.
> 	    If you have a TPM security chip from Atmel say Yes and it
>   .git/rebase-apply/patch:93: trailing whitespace.
> 	    will be accessible from within Linux.  To compile this driver
>   warning: 2 lines add whitespace errors.
>   Applying: video: handle HAS_IOPORT dependencies
>   .git/rebase-apply/patch:23: trailing whitespace.
> 
>   warning: 1 line adds whitespace errors.

That is very strange. I did run checkpatch before. There are a few
warnings not to touch obsolete code unnecessarily and a check about
using udelay() (pre-existing) plus two missing blank lines in pci-
quirks.h that I ignored because it matches the sorounding style.

I did notice that lore fails to render the subject lines for some of
the patches. But I just tried fetching the patches with b4 on top of
v5.16-rc7 and the resulting tree passes "./scripts/checkpatch.pl --git
v5.16-rc7..HEAD" and has an empty diff to my branch. What tool did you
use to check?

> 
> > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > ---
---8<---


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
