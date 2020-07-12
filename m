Return-Path: <SRS0=qDH1=AX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA0CC433E2
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2020 06:11:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AEAF20725
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2020 06:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLmX95vr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AEAF20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kzYg9FRy4a+b2D10bhFPogTXINy2JIeEpp6YSpTNM0g=; b=RLmX95vrcYNzd47oYw13A1/PE
	olxYbJpn8Ckm9Co7umyAq79Sd1G2ix6wVK70RuekgEFk3CyxxNMxycoOu+3jFZ/mYB1iwHGjNd2DJ
	B1chvueTISrB9HfSPOCY9VjQfjT7WPvcUb4Z6Bha2EcYe4SWN+kDDg+j3ktNblP6CbzOty+pfM3Zt
	0+ijHyEBiBPD1qNwl8c3ymAkAl+17ObiqRCFMbLpPTlxDoTIiWVVYmZ9TxIuCsx0SUzHBdCCYHyCk
	iZR9jpK7QgMNwKTB0YEWGbdDcq7FiDC3CHaMOTLu+DC4B4iDlPoQOG4LnbAvPGWJBjSdA7JHjUWTC
	Ym3B+ZXzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juVCR-0004G1-Ma; Sun, 12 Jul 2020 06:10:55 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juVCP-0004Fd-Da; Sun, 12 Jul 2020 06:10:54 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06C63FmQ121057; Sun, 12 Jul 2020 02:09:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1fhwuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 12 Jul 2020 02:09:43 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06C63Qvo121566;
 Sun, 12 Jul 2020 02:09:42 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1fhwu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 12 Jul 2020 02:09:42 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06C628b0007626;
 Sun, 12 Jul 2020 06:09:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 327p0vr4ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 12 Jul 2020 06:09:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06C69clI2031964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 12 Jul 2020 06:09:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4098BAE051;
 Sun, 12 Jul 2020 06:09:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41FB9AE04D;
 Sun, 12 Jul 2020 06:09:33 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.119])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 12 Jul 2020 06:09:33 +0000 (GMT)
Date: Sun, 12 Jul 2020 09:09:31 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: Add and use a generic version of devmem_is_allowed()
Message-ID: <20200712060931.GM781326@linux.ibm.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-11_17:2020-07-10,
 2020-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=764
 suspectscore=2 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007120047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_021053_543764_2AA38D65 
X-CRM114-Status: GOOD (  19.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org, brendanhiggins@google.com,
 elver@google.com, glider@google.com, zong.li@sifive.com,
 mchehab+samsung@kernel.org, linux-riscv@lists.infradead.org,
 alex.shi@linux.alibaba.com, will@kernel.org, dan.j.williams@intel.com,
 linux-arch@vger.kernel.org, uwe@kleine-koenig.org, alex@ghiti.fr,
 takahiro.akashi@linaro.org, paulmck@kernel.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, ardb@kernel.org,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, kernel-team@android.com,
 pmladek@suse.com, zaslonko@linux.ibm.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, rostedt@goodmis.org,
 broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, mcgrof@kernel.org,
 james.morse@arm.com, mhiramat@kernel.org, akpm@linux-foundation.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 02:19:20PM -0700, Palmer Dabbelt wrote:
> As part of adding STRICT_DEVMEM support to the RISC-V port, Zong provided an
> implementation of devmem_is_allowed() that's exactly the same as the version in
> a handful of other ports.  Rather than duplicate code, I've put a generic
> version of this in lib/ and used it for the RISC-V port.
> 
> I've put those first two patches on riscv/for-next, which I'm targeting for 5.9
> (though this is the first version, so they're unreviewed).  The other three
> obviously depend on the first one going on, but I'm not putting them in the
> RISC-V tree as I don't want to step on anyone's toes.  If you want me to take
> yours along with the others then please say something, as otherwise I'll
> probably forget.

For the series

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> I've put the whole thing at
> ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git -b
> generic-devmem .
> 
> Changes since v1 [<20200709200552.1910298-1-palmer@dabbelt.com]:
> 
> * Don't have GENERIC_LIB_DEVMEM_IS_ALLOWED select ARCH_HAS_DEVMEM_IS_ALLOWED,
>   instead just adapt the users.
> * Remove ARCH_HAS_DEVMEM_IS_ALLOWED from the arch Kconfigs, as I forgot to do
>   so the first time.
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
