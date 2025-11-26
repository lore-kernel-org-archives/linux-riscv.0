Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12460D1036D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Bqp3PTembwo2Vr5TGG5vTj4KcvVBLk+QB9jpy+8Shs=; b=PgZwg98uBKyxTG
	3o6RWf/R7VXEcXfNtW90VXfyaPczgQcaFu2cbZ2+IJvA3cOWhqezX3w9NQupgdMT1XiVW7pUN/TRD
	PsEe1t4WSaaM2N2AuUKb9jqj2YDvpWZaEbFlOQVWdok5rLcwwNhChA/6D6cBwE795DXfGTHTLig/e
	1+97IeHQ8f0biIMrGk3tOCxPwOOZfwkmgyKiS5QrgWJNrtrEpYYGiHW0Glt7BZkCBrZDXUa4QGihC
	X2qXlATkpvlVz/CGy7Q3YsBIwRU20KI/nepbMG3J2MZ2X0LqGpbBGX2Kqm5B+RFazGAcrRJpae+Uz
	V76TXA4KnSkOspWnk+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3Nh-0000000E7Xv-3hEZ;
	Wed, 26 Nov 2025 00:27:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3Nf-0000000E7XX-3JL9
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 00:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2C3343699;
	Wed, 26 Nov 2025 00:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDFCC4CEF1;
	Wed, 26 Nov 2025 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764116854;
	bh=XTbEEejRVPuiO6YOFsZ6JI/kIqJErz+0cTJOWXOKBe4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ta+cvHDOOKjacx0ul6GVTrh1fIsb3lEWuwNo7hMcHT4mxlAMd1vRg5niu2q+QpIwC
	 idXCCLhAuGYg/ijwiqnlhKSGDFe9YdLMGen7WN3IUZxSDz8zmhHZb3x8nytxgPHlJ5
	 oDQUhiPc1LhmTpOESkL2efVAw4hJQpZLL6vKem/Dcn8v6nKDNQXjqcOB+bZP7tA2Lx
	 i4t4z4AXEca8qYJBhO/e0371Km2d8toyae1Kc1F0SJ6+q/YnvAsKNPi7eZg9G8BP/1
	 KDVwCt03mrz0RRcxLdR8ysenbdkZ4iNp2pr5ZWaGin7nepzX42nKBqRuTk2QP0fLJC
	 arOPh75w+BABQ==
Date: Tue, 25 Nov 2025 17:27:30 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Qiang Ma <maqianga@uniontech.com>
cc: ardb@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message
 print
In-Reply-To: <20251031024328.735161-1-maqianga@uniontech.com>
Message-ID: <f9d632d5-22dc-8b14-8a70-37737a78f206@kernel.org>
References: <20251031024328.735161-1-maqianga@uniontech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_162735_872043_EAFA4E55 
X-CRM114-Status: GOOD (  11.41  )
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

On Fri, 31 Oct 2025, Qiang Ma wrote:

> In the efi_create_mapping() in arch/riscv/kernel/efi.c,
> the return value is always 0, and this debug message
> is unnecessary. So, remove it.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

Considering that Ard doesn't think efi_create_mapping() should be changed 
to remove the return value, and that the ARM version of this code retains 
the debug message, we should probably keep things the way they are.  But 
if you can get a Reviewed-by: or an Acked-by: from Ard, I'd take it.


Thanks for your patch,

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
