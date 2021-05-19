Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC82C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:09:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E3161042
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 15:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E3161042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8JiC5ratQf3aMzxPXRuYLgVLfhRZINl376oazKG/OSo=; b=ZVHtkprYXoUwbC6LDxhpf+j0j
	0XyqbUnJYB83H504O8ne9cyrjYbQuujobTOaSMcgfLNOF5mG7YLd+cvsWvu6CgCt3tWP2VfyFfHwz
	SdBW8+Bl921NMU5uy/W4UJYkt2+qi3iP2exBSXslVTl8A8DTVmvby1LK15P0Z6NVXYlwVrNB9jdQP
	Fgw3aLrv8/kK/QIdGzDRnsrjsdmxOKTwvqjnyEhv45xqjalnzue6/I4HusrMHFuIcZoBlR8rw5PdU
	a8lCOOUWZHsEP+qEM3lYxnYJJ14ir0EGnB6yvAGFiYAJ4NNZokO8f1am4oAhhRrou4hbSYJ9kWhDe
	dKhGJfFKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNoR-004L9n-BU; Wed, 19 May 2021 15:08:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNoP-004L9V-24; Wed, 19 May 2021 15:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O4M1xcTAuM/DDdc0c5CDLl/yAMutYPdkSv4nE2h3AeI=; b=a0CxK+TGeDIcOWm60l9ioIBc+B
 IRf/W9MYmHgkcAJuZUyvhQJ1bI1dCzjp+ki09ngNztx50z0tllcoz560uS8ZVhBjf8FfJg2vgVXFc
 Uj5Prhn+kvjaPKbRzXVElZU9B1nvJKvR1DraZYT9QHMExIQFe0zSlA95VO9/jGmGAN9GjVKvcXdVK
 tRV9fHKxXswPcHIZsnqhjFwl0595ZKyCKfu+8qYfSeOMnHfpAjPAkrC2ALyuubhR31EsOORx2F8O8
 NHT3Bp7Od4ZYI7fct4awq9nPLbVo1IRzhmwg3h6bsph+7JGF7RM/nsjUi5XiQjSip92t+dXkiYKAj
 lRM0zXjA==;
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNoM-00FZnf-DC; Wed, 19 May 2021 15:08:39 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14JF5rt9115755;
 Wed, 19 May 2021 15:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=O4M1xcTAuM/DDdc0c5CDLl/yAMutYPdkSv4nE2h3AeI=;
 b=oiJTPjfiELJ31h/2dywpDTju0Qrln1slSZD7cshRMtRC1k/KtXgpy+pe9GMtWVazE3OI
 T43P/YIzlig6H66ly2aKF7u3kVapM/k15DD0B3UxeQsIhQv1NV4PSFyb1WryaUD1CZBQ
 FFqwljp8bpOKSyJyNYB4Wyq6SDS4HwAvqlsz2komMzLQEXQsZLN1fCER+K8D+To2ry0B
 517gY7iFWGrcvZqNfJ/TIrh0AA140vIF1hgaDBZIlVAvxVIcAQtm5DiurBep9g+eiZUT
 UjhhSKTy+SXYwuNJTzyt18K3FAEz/7vz4bre9m2YARBqXaWviYUKa//gMujh8daNUqZY gQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38j5qr9wfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 15:08:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14JF03JH086247;
 Wed, 19 May 2021 15:08:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38mecjfk91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 15:08:32 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14JF52Qc141441;
 Wed, 19 May 2021 15:08:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 38mecjfk6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 15:08:31 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14JF8S9g005989;
 Wed, 19 May 2021 15:08:28 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 08:08:27 -0700
Date: Wed, 19 May 2021 18:08:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <20210519150814.GY1955@kadam>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
 <YKUZbb6OK+UYAq+t@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKUZbb6OK+UYAq+t@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: DSYkubxMfO3UDZdxS1ycNWkOZn5DmMy3
X-Proofpoint-ORIG-GUID: DSYkubxMfO3UDZdxS1ycNWkOZn5DmMy3
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_080838_596488_2D6AC41B 
X-CRM114-Status: GOOD (  13.63  )
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

It's sort of frustrating that none of this information was in the commit
message.

"This code is not ready to be merged into the arch/risc/ directory
because the RISC-V Foundation has not certified the hardware spec yet.
However, the following chips have implemented it ABC12345, ABC6789 and
they've already shipping to thousands of customers since blah blah blah
so we should support it."

I honestly thought it was an issue with the code or the userspace API.

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
