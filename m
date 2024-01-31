Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53315C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VufPp9U/O0E3p4T0c7RYhJ52CfilXvOsjBRmOvws+gw=; b=gmM0FhqV+vlyTF
	OqdY/gBp7UbZu9WgIxuedd75/AoUG0BTQ34Xn9Z9IJGqUJY1YZxkeGzJ9hzDH42hlRMoVis4l9pOx
	qIdL1qGb3AWUl5N5+kCflzMDp4K44JbPN7jBBHorxlwEA1TRCEdBDnr/lQ1ef5W5wRr+OrrT3TUJN
	n7TEjacMrlLJFpb9i7Dq+3bG3av/s57fNcYqGESlzPkvnd3nJw2ybWHh4E1HvKWfYjqbteYenYlch
	6+kbwQQs6LzsBAZ7JknKJFwwUBwPaQNAlt3oiWvD6aSZaQhcj3YLiFxU5KlcYBwwDm3Wttn3OdjJr
	LSbD4pi+AA+ufp7FwJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAkP-00000003dtp-3CXj;
	Wed, 31 Jan 2024 13:35:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAkO-00000003dt0-0IQS
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:35:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so734558966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 05:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706708122; x=1707312922; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViRvE8SQ8ThNSnENx1fIPLUVijzaq5MG8JQFKM9C1Ys=;
        b=cCQXfRPSR5F+BBVxwy0GabRLMwub074EpLhbE06NYLPi22zg6/f2dFfK9Bm1Dg33qc
         bSQnMPMH+qNiyGITlruRNfUT7cPfMjlbuwG5DbRE5h4+S0XM/Gi5+WT68KsSe0JdY/Hx
         9qUIW6X6d78HAPKpxwgBCGTzQ7TK4IaeQze022ni3dw04PYdbNvttIKElBWseLL3rcNf
         n0FzHQ/oLxlbJA8ZwIaT7iwLKoVA4Vl95OiW8GCXMRIzbdCYTvgQe0ggXjkLNCP9r+yn
         jY/zGUr0/DrQmGzR71UUATGjaf7w6OKCd9/6g2Q+P7Hd/p2GMIIIxISF6V2P1hgld/8W
         jxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708122; x=1707312922;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViRvE8SQ8ThNSnENx1fIPLUVijzaq5MG8JQFKM9C1Ys=;
        b=Pn1CkeMKoR0kuWK9YSTYYbbrQ6t7nx2DkcheUo5ZaCnojh9tIOeJ5C7Tcy2yAvIQwH
         Piqrsi4CMivMSCeLf9TBQDfUtbfZEgPWsZgMP3s7Wjk2tA3D2ZWiXWvSERnMDwku8YJt
         taLhkLTu0bPa7FqVEgpP84bLi5LpB44q7EIRY5M80dNwEVudV+Z5HNd0b08LgqY25KGY
         WNXVGoi0iQBpCFNLyqFlSJOEwbZey9sRNFbZvLsYspI3Lmw1CzboPP4Zvgv6dbv2QiZB
         5FsPzF3JLdl2z9x2fTmLY5HuHTIiQ7Qs1IN3++IXgtJHUnG/NQeJPuN8hb/pVg88RbsY
         ZHRA==
X-Gm-Message-State: AOJu0YzeXNEQGFzhPsJ6YLSUkLEk/ug5aYo4StWJp4b8U7Z+YwcKNLxz
	LMxcZ6YzYEkCrdlDSrQ773bMwozFqxHm89ByN1ryGOsRjndAdyhbKTbNHbfuIaGvV3wZf9aVpSL
	2
X-Google-Smtp-Source: AGHT+IHv+Tu32ZL0Le3kczT0QCvclrQ9yu/nmreiZvKFKPPA0D3jG6gYPOdef3uFuyyZxeqfKwtH/A==
X-Received: by 2002:a17:906:a855:b0:a35:6299:a349 with SMTP id dx21-20020a170906a85500b00a356299a349mr1236851ejb.32.1706708122155;
        Wed, 31 Jan 2024 05:35:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a3664259b81sm826868ejc.134.2024.01.31.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 05:35:21 -0800 (PST)
Date: Wed, 31 Jan 2024 14:35:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
Subject: __get_user_8 / __put_user_8
Message-ID: <20240131-a63b3db583ac950022128a08@orel>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053524_138588_0C2BC3F5 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi all,

I'm looking for thoughts on riscv32 __get_user_8's and __put_user_8's use
of the typeof(x-x) trick. The trick is nifty because it ensures we use an
integer type of correct size and sign when x is an integer type, but use
ptrdiff_t when x is a pointer, which avoids warnings about casting a
pointer to/from an integer of a different size. However, sparse complains
about this because restricted types get reduced to integers for the
arithmetic and there's nowhere to insert a __force. Furthermore, while
__get_user_8's ptrdiff_t cast looks fine, I'm not sure we want
__put_user_8 to sign-extend the 32-bit pointer before storing it in the
64-bit memory region (as its ptrdiff_t cast will do). Arguments can
probably be made for sign-extending, though, one of which being "it's
always been like that".

Anyway, I looked at x86's and arm's __inttype() and tried to consider
doing something similar, but I didn't see any foolproof way to apply a
cast of typeof(x) on everything except pointers, which makes me inclined
to leave things as they are and just let sparse complain.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
