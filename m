Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC08AEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL0BlEvTME/53ZrnUln3KpBsmsG0UZpNuSMmEduDxJM=; b=gX8Sf8l28Pk5wj
	u8GJQa90K5BC4kWBsuXaUTzjPKn25WHWx3bS37+rBwFjLsz6RwJlWfbM+M/N6oYjr5SJzFURrGaSv
	PCIIaq6qPWjwou1uWNIkvUpDrq5gT9S5idEOEmIkw8F7thtCxtip31Se9Co7e4RZiAgAwNJ80ifvm
	KGQkh9Nbrx8D/NAtQ4tjkqRXp7RzazTOWWN+4GNiWSfVl2xs3M0pLkXmR77FSF9IhAW/X+Fz6pM/8
	H96JI58Gy/0cNCid44pZSLb8tPWqbGdDyd2UTGDbp8vCWeY7Hy44LsecQ73fJI3Wmuc9qQA3H/6ay
	B+scOcJFp2DYbOBirEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCN7L-001Dml-0L;
	Thu, 22 Jun 2023 16:25:07 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCN7G-001Dlr-0q;
	Thu, 22 Jun 2023 16:25:05 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MGGlKS013633;
	Thu, 22 Jun 2023 16:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=qD1qlhKCKV9Gk/Gjt6jadS5UFlsWxSGO0aUPUrItqzs=;
 b=jYYfGeGRQ3zLxjiAvNda/y4OI0ywP/4TVxqY691pSz9R4RSvpFS617nUYNj5UUutDpom
 UleDGVAcUhDXI+PuKYQkAWE61q0e1MrEx59dpSq0lnGywnAQCTuVXeIzei8NNSg3y1yt
 XgqXarDC/ZJzCx1hV/X+HF+DKQG9z+Q54SXgv+ppPs2lEa5WuSvXEkNqNsJWWhW94mg/
 6QMJW+Al7D23OIoT2g86XUFe3uWxhCGdhwQvlEcu+N2jps3uYBviGEJeLHNYiHumKmZb
 b+lkg15evovpPWtaS8fTKKOPolOBeanzafGNt614LBgCD/xl7rhZ7zwuo0Ez0+4Vt5dv zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rcsfkrskb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 16:24:16 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35MG49ni025954;
	Thu, 22 Jun 2023 16:24:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rcsfkrsj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 16:24:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35M9kkIB029518;
	Thu, 22 Jun 2023 16:24:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e3kjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 16:24:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35MGO9tV10420856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 16:24:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29FCA20043;
	Thu, 22 Jun 2023 16:24:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77E2320040;
	Thu, 22 Jun 2023 16:24:05 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.59.34])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Jun 2023 16:24:05 +0000 (GMT)
Date: Thu, 22 Jun 2023 18:24:03 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org,
        paulmck@kernel.org, peterz@infradead.org, frederic@kernel.org,
        akpm@linux-foundation.org, ardb@kernel.org, samitolvanen@google.com,
        juerg.haefliger@canonical.com, arnd@arndb.de,
        rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
        sebastian.reichel@collabora.com, rppt@kernel.org,
        kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
        ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
        mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
        xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
        tsi@tuyoix.net, bhe@redhat.com, hbathini@linux.ibm.com,
        sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v2 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJR1o0lzhIUdpTb+@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-13-eric.devolder@oracle.com>
 <ZJKD690QaX1IgiAz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <b89bb8d6-77db-76fe-e360-f6c439b80e73@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b89bb8d6-77db-76fe-e360-f6c439b80e73@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qCenS3OA9UceHHV25yycwEWlCVqc_XCw
X-Proofpoint-GUID: t_YQDqT-rDR4fb7suT2OXhiuNh4-PXUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_11,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_092504_327210_A28C3142 
X-CRM114-Status: GOOD (  23.90  )
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

On Wed, Jun 21, 2023 at 12:10:49PM -0500, Eric DeVolder wrote:
Hi Eric,
...
> > > NOTE: The original Kconfig has a KEXEC_SIG which depends on
> > > MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
> > > dependency (using the strategy outlined in this series, and other
> > > techniques) results in 'error: recursive dependency detected'
> > > on CRYPTO. This occurs due to any path through KEXEC_SIG
> > > attempting to select CRYPTO is ultimately dependent upon CRYPTO:
> > > 
> > >   CRYPTO
> > >    <- ARCH_SUPPORTS_KEXEC_FILE
> > >       <- KEXEC_FILE
> > >          <- KEXEC_SIG
> > > 
> > > Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
> > > for KEXEC_SIG. In practice, however, MODULE_SIG_FORMAT is still
> > > configured-in as the use of KEXEC_SIG is in step with the use of
> > > SYSTEM_DATA_VERIFICATION, which does select MODULE_SIG_FORMAT.
> > 
> > No, it is actually the other way around.
> > Could you please provide the correct explanation?
> > 
> > AFAICT the MODULE_SIG_FORMAT dependency was introduced with commit
> > c8424e776b09 ("MODSIGN: Export module signature definitions") and
> > in fact was not necessary, since s390 did/does not use mod_check_sig()
> > anyway. So the SYSTEM_DATA_VERIFICATION could have left intact.
> 
> Thomas, would the correct explanation be simply indicating that
> MODULE_SIG_FORMAT isn't needed as it is not used by s390 (crediting your
> summary above)?

I guess, you asked me? Anyway, I will try to answer as if I were Thomas :)

MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION.
But SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so
dropping MODULE_SIG_FORMAT does not hurt.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
