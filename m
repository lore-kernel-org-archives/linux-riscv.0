Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32177C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 10:17:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48FA6108C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 10:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48FA6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2MV38gytZSfq0RaacIeShgAJG3I7XRFP1+2egBFTBs=; b=H9BSspjqcJZLNvMRHGdv0Rqvh
	t3PDtDkkhbljb6v7yp2I4vvgFvJE+FhwHh6X3UzVRsHn936H1cBB27LWfZBXRG89T/nofICHeMfYT
	K8xznJY4eerP6rB2WWhL8RaRltQsyWtVRKIkwSDCDoYOmwU97jQmJhHkADP3joW+7sEYhnJF/kyfq
	xZvQJdOMTAdN93Q9K+hLpxSZWvXHrAoMbMwNgbc72cqYQWpuPpbGXAhTVS3RUJgAxBagNiJjE/X1p
	0F63tETuMh33OjVyF8L+0dAkClZy3cDUatxd5LM/cfie+K7pVsHhRMZWI5MkE4hTlFraRdyf/ie5Q
	R68gZqjxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJGd-003ZrG-QM; Wed, 19 May 2021 10:17:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJGa-003Zqp-8O; Wed, 19 May 2021 10:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hGk2Jt4LTPzO1S2qngYtkz7Cl2+5Qs1xMzLMoopxFvM=; b=EbirN8hnZ/e0OvQoTrs5S5V6+X
 vG8D1zgjq4iXIwl1xQylVs6nIZiUHh6d71h8QExUxlSE/KE/9UdaaKBnUNJKxSwqQfzO8rrTO+MU0
 NxaRCuLhiLR2DVix/yNPXgSdRn2zBE4kopls6tl62pcnjSCY16htw3PMVadR7sblFuWPvyfuQUprZ
 le7ZrV5vlt/bTNrBtlBTpLK5r65rGJj5TBDJ2kut+0Oj4QyMnwJrKB7ucDsGPmQYCVz9GM9r1/6Hi
 xhgf55whsvmzI9FCzbI0h3rag3ifvFcykPTgA5DrMZZ67o5lLYy8rPUNkrWItQr+q5E/PxrHS4QUA
 aogVCAPg==;
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJGX-00FLuv-H2; Wed, 19 May 2021 10:17:26 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14JA5ATk111744;
 Wed, 19 May 2021 10:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=hGk2Jt4LTPzO1S2qngYtkz7Cl2+5Qs1xMzLMoopxFvM=;
 b=ttyC7XAEgInr/OmPK6WCkIceXQvVsWucEMfbcxdKhW/9z791xwEt+tjTFhTaqXeBLZY9
 uNzvEUgitVBoYKI0x7sOkl9HH33B1MiWnotnr5QbsimtBXOQh62eVIexGWROYjejBULY
 lIlNLCpc8v7C+oymJs+erxTRYJaXkIX5wkxibCSrW/+IKbODJhmHlrjt6zd0jK3+J5Yb
 8/WogueggqkrAFq3/Fk516fjwerQoBxH6vdFZ4RX3Rw8ELEq0j4pCcJqjTTPikNv1LTj
 nvUJKS+tR/BXssO/pOrWqkZT47wLQ6EO7wcVFZLAoK1fD4PXbcWBBlM/fFE1TCyD5u/O iA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38j5qr93g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:17:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14JA5w25046922;
 Wed, 19 May 2021 10:17:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38mechqq6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:17:18 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14JAHH4o129654;
 Wed, 19 May 2021 10:17:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 38mechqq5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:17:17 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14JAHFgb015636;
 Wed, 19 May 2021 10:17:15 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 03:17:14 -0700
Date: Wed, 19 May 2021 13:17:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 02/18] RISC-V: Add initial skeletal KVM support
Message-ID: <20210519101704.GT1955@kadam>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-3-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519033553.1110536-3-anup.patel@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 6jRe5b4YCQkMwwXaSxJBXaR3mYMvI9hZ
X-Proofpoint-ORIG-GUID: 6jRe5b4YCQkMwwXaSxJBXaR3mYMvI9hZ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_031725_724411_86D6E26C 
X-CRM114-Status: GOOD (  16.61  )
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

On Wed, May 19, 2021 at 09:05:37AM +0530, Anup Patel wrote:
> +void kvm_riscv_stage2_free_pgd(struct kvm *kvm)
> +{
> +	/* TODO: */
> +}
> +

I was disappointed how many stub functions remained at the end of the
patchset...  It's better to not publish those.  How useful is this
patchset with the functionality that is implemented currently?

> +int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> +{
> +	int r;
> +
> +	r = kvm_riscv_stage2_alloc_pgd(kvm);
> +	if (r)
> +		return r;
> +
> +	return 0;
> +}

Half the code uses "int ret;" and half uses "int r;".  Make everything
int ret.

regards,
dan carpenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
