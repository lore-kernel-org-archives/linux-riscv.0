Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67971C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKdE7Ns2z4LNtiNYRX8I/hxcLfF/Wvfyp9MQQYbSUK8=; b=Uj2RVwEEF2TfHF
	5zfX5oa3PTB1eWJd5cxJ63/eD8Yb16lsoJ+12AwVxas9J+fSblMU5JACFqGl+WwHDhdIztKFiJ7ex
	EJLXx1lKvaoa4KuNmKOyEyvGuVI0H4GkDTTaN4Nh1YsBTZA73tjI6dEsP9/vK1gAVuBaIeuONAv+S
	2sbkLRBywH8oDR2GTiPzV3Eta6Wj3jt9xiqf2tQu4kkZ9Rn4lOuFQe13kXWYQqF/q054NMD6N/pUH
	6Ybwttjra8fmZvUa83OCzQDH4aVggm/HmLEADlU8mGiCGn8MObB8Cw0b19dSiv6tzRMFCfQ23cgoL
	PlPjw5YQH6/MIkr9HdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Bal-00000006uHL-2OPk;
	Tue, 22 Apr 2025 11:15:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B4Q-00000006oL6-1Wya;
	Tue, 22 Apr 2025 10:41:43 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M87Pmb014494;
	Tue, 22 Apr 2025 10:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=2vBVjmEn5NTa769mIj8GmdhBQLhe0x
	76SUXx/x1ydTU=; b=KCWe+JyPXZxPGEeoK+BOdCrNbtsxJb4V9z9BQcp5BUBqYV
	37VU8eW6wcULQQ+47XX+foEl2LJOpLzDYicKyXGMbmxSsxY/RjYRpPLwU4gd3xgo
	ogftcFUpG4M5EExmKa9VSwegOZZCOthSnTL5tZzw/QsNni+y3b8rifq7WaNGiCQj
	j+1TNRLnCGFaeE7g7IFvUokadm9sHdkM1DTa5ZNw8G70CZ6275/qaUa7U1Maq/WW
	0YeViG35vFRhe3g8H8uT8aYQmfUlyhrkgc3/p524PO1EQhqkXTZkl6383xOstWCu
	KymJAGFH+gNa/NTzBcefpqMr3IQs8YYjNit6pTwg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4667ap0qvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7afmQ015373;
	Tue, 22 Apr 2025 10:41:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkjbg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MAfbYl59376010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 10:41:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39AF620043;
	Tue, 22 Apr 2025 10:41:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8204220040;
	Tue, 22 Apr 2025 10:41:36 +0000 (GMT)
Received: from osiris (unknown [9.87.146.239])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Apr 2025 10:41:36 +0000 (GMT)
Date: Tue, 22 Apr 2025 12:41:35 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 10/13] crypto: s390 - move library functions to
 arch/s390/lib/crypto/
Message-ID: <20250422104135.24507Bb1-hca@linux.ibm.com>
References: <20250420192609.295075-1-ebiggers@kernel.org>
 <20250420192609.295075-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250420192609.295075-11-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5pNKzws c=1 sm=1 tr=0 ts=68077264 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=EBXGqsIhDzg0S2J9wWsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: FKpmuf9m7FggGnatUI-UByB2a5PrqXcD
X-Proofpoint-GUID: FKpmuf9m7FggGnatUI-UByB2a5PrqXcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=709
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_034142_421835_9248D106 
X-CRM114-Status: GOOD (  15.91  )
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

On Sun, Apr 20, 2025 at 12:26:06PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Continue disentangling the crypto library functions from the generic
> crypto infrastructure by moving the s390 ChaCha library functions into a
> new directory arch/s390/lib/crypto/ that does not depend on CRYPTO.
> This mirrors the distinction between crypto/ and lib/crypto/.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/crypto/Kconfig                 | 6 ------
>  arch/s390/crypto/Makefile                | 3 ---
>  arch/s390/lib/Makefile                   | 1 +
>  arch/s390/lib/crypto/Kconfig             | 7 +++++++
>  arch/s390/lib/crypto/Makefile            | 4 ++++
>  arch/s390/{ => lib}/crypto/chacha-glue.c | 0
>  arch/s390/{ => lib}/crypto/chacha-s390.S | 0
>  arch/s390/{ => lib}/crypto/chacha-s390.h | 0
>  lib/crypto/Kconfig                       | 3 +++
>  9 files changed, 15 insertions(+), 9 deletions(-)
>  create mode 100644 arch/s390/lib/crypto/Kconfig
>  create mode 100644 arch/s390/lib/crypto/Makefile
>  rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
>  rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
>  rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
