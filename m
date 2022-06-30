Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D88CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGHi3B0rxNzKCZevNVg8fUO/nvQCa1q3asyacbXuxd4=; b=fOl7y9iygoaujO
	ucftfrDnwiFC8loyA0LpwvrhaCj+b4UOQ87Cj4EWVsgBCxLanwWT3ZAOUUy9V6alVn0ONZqpUPaOA
	KwLgyi/qrcVubLBcqRUbUnqo/srH6TgYNqST3NvcRJBJFB6u4AJolGMQrHXBKB1l3rUo/69XdaQcD
	1mZVKPNeXnrNp3cl48NMD0h/PFOpQsoy7HN/fToppz8bo3TwC9RDSkR0QnK3HQE8vBHs+LuFoPNTv
	FUgX0m2UsCYgx5SUshIU5z8aFtJjUiBa9eDr13DgFR3WjHnNokjgAwlXhUkXW8t0rgG3GLsGkOV0y
	W7w6khzlKQjtCVedNvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6toW-00HBzY-1K; Thu, 30 Jun 2022 13:02:32 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6toS-00HBxv-Ll
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 13:02:30 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UCCcJE021718;
	Thu, 30 Jun 2022 13:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Zin55iReFVYask8LlcnJU0tNnOs0FShBSAddaEKcrN0=;
 b=dbkl6VK6WiMjcBPjLV73Br82dDU9TRpCFWkPS/CAJZ9qymYCsNoN/SMkmv9kRwqIdumj
 iYp3Bv1R1sx6ZDo8zRY5OetkmqwTrYRV8T9YHRG4oppAdG5jV1T7m5WVuW/b8Gfp0Ty2
 rFk8BNsZgVEnIn/glP6XRDFGwm5kH+5f02To6vftesLmBLuxBN0g/c1HK5CiSl/ETN7C
 swbskNLA8OhYCMp6guygBJSJft4sR49tQ4MzEOCGMVMgYFVSZrTJS5pAAxXzsIhCCQYg
 0N5yqxYTA69m08c4c7+vbxjM6N9XU4cKs8Fep+OM751SiAIQTW3kFXPmBDXQadq9SKGi bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1bmmsfa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 13:02:20 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25UCDEwB022982;
	Thu, 30 Jun 2022 13:02:19 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1bmmsf8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 13:02:19 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UColij026794;
	Thu, 30 Jun 2022 13:02:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06fra.de.ibm.com with ESMTP id 3gwsmhx3nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 13:02:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25UD2EsX21561680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 13:02:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B3F14C044;
	Thu, 30 Jun 2022 13:02:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7549C4C040;
	Thu, 30 Jun 2022 13:02:12 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.211.82.30])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 13:02:12 +0000 (GMT)
Message-ID: <85e23c1c9460b3b3e9afbeb0789bb0320dda3f51.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/5] drivers: of: kexec ima: Support 32-bit platforms
From: Mimi Zohar <zohar@linux.ibm.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, dmitry.kasatkin@gmail.com,
        linux-integrity@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, Rob Herring <robh@kernel.org>
Date: Thu, 30 Jun 2022 09:02:11 -0400
In-Reply-To: <20220624044811.9682-2-palmer@rivosinc.com>
References: <20220624044811.9682-1-palmer@rivosinc.com>
	 <20220624044811.9682-2-palmer@rivosinc.com>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OIbSsAg0_Mv4tb80y96_oDp23Vz_FRel
X-Proofpoint-ORIG-GUID: 03tDXB3J7cuQMldkokm7ErA1U1XRRNKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=977
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_060229_005088_8C891680 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, 2022-06-23 at 21:48 -0700, Palmer Dabbelt wrote:
> RISC-V recently added kexec_file() support, which uses enables kexec
> IMA.  We're the first 32-bit platform to support this, so we found a
> build bug.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
