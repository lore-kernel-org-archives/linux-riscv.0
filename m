Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D25D4A5F5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 04:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK07HOdWtxuTd0jCYoGqlQVu1zIQOEZoh30nbKtY/2Q=; b=N8/n7Rnns4xhPzDewDXj1U0Np+
	jPOj4zkmFFHbH9Yc36utrJgDmp7IIBbqYkV6cuwjIjbmrBmTcPo+lFBlq3WM6PCZSkLp8xiKsNwP4
	QaM5w9qAV+SXMc+RGihZkci1+qxM9+cmSlEhHWxcLXSqbb30osaq7/D5p+2nJbmylDmhPALVjz9pX
	F41gOxqzBPOS/rIxszWZrQ2vQQ6BJNTGckMFo2cn+ZpXjxkCZ4MR0RC0FXx2ddkdk3DmKkCW7XkKJ
	7qJmTV00YwPhWXlUMoXeiBz0mmzRSA25iJxFYDHsA6DQqvaEIQ+EBNYseAoOIz5g6OFnAAKQAcZs9
	UlBZgRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgxyq-0000000FBsJ-186R;
	Sat, 17 Jan 2026 04:32:08 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgxyn-0000000FBrr-2SxZ
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 04:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768624323; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=S2OHuJi/yz/Cs1m5SZ1eWya83DfuWdjDDqbxTmTV8Og=;
	b=k1HBA5dLX0//H4mnjDbgiSpUT1me8oXOf8kM/2gNpN/KlgBO47n4VkmReP/PclvchYUm0iqphi1RnCu41gOTjC43avvPdw1Kn9Ji2+QYY62EWXleiZr+AMVKJLBZeK80jy4RTmYCE0qjIKJP6UMxmXJko1813rxUFdKoF3rVHmg=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxC61S8_1768624314 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Jan 2026 12:31:56 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org
Subject: Re: Re: [PATCH] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries 
Date: Sat, 17 Jan 2026 12:31:49 +0800
Message-Id: <20260117043149.76084-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <q2jjixx6imiwdwlxiu4cnh6nghnueivjge5d4jscor5q6yx2el@lxujpebn3nsx>
References: <q2jjixx6imiwdwlxiu4cnh6nghnueivjge5d4jscor5q6yx2el@lxujpebn3nsx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_203205_823062_4A493CB8 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3976971095166596536=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3976971095166596536==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>On Fri, Jan 16, 2026 at 02:12:06PM -0600, Andrew Jones wrote:
>...
>> > @@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>> >  		/* Invalidate device context after update */
>> >  		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
>> >  		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
>> > +		/*
>> > +		 * For now, the SVA and PASID features have not yet been merged, the
>> > +		 * default configuration is inval_pdt=false and pc=NULL.
>> > +		 */
>> > +		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
>
>Shouldn't this iotinval come after the cmd-send below?

Yes, that's a typo on my side.
I’ll fix in v2.
>
>> >  		riscv_iommu_cmd_send(iommu, &cmd);
>> >  	}
>> >  
>> > -- 
>> > 2.50.1
>> >
>
>Thanks,
>drew
>
Thanks,
Fangyu


--===============3976971095166596536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3976971095166596536==--
