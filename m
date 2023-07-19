Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C2EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIHNNmzvmgLzwc7up7KDhA6thslRUz5dFYN3F6ujUOw=; b=uEaqWzKGfjNyo3
	7OZFTWeDkiUyiNYQktx9+6DzY+8qKA33HY8ZhaSzp8NZpXdzZ7mNJb7zTlf1s4YL0VrTM48FZa8IH
	HVkJJgYYccwbPhETqmSUBY2ZBVh2PH90qCKDLKw5+3OOzlFKBuXoyEms82Z4hsFJnlbKCfBcPyRP5
	9sLO34rx1fQAgKEt5FRnrapW/QhIEat+dIjV/q9Ail0/MrT/Zb+4M5HZI7AQQJ6XMGwQq/7THJf1P
	cGsTRiF6e6XIkzKZzUS7zIN5g9GF+qw25xwmoWwelEGsjQiZLNKmjkLCH5LNO3tmhddbcGF/WXywg
	Km+YxC1mow7PJrmY3I0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM149-005x8X-1m;
	Wed, 19 Jul 2023 06:53:41 +0000
Received: from out-48.mta0.migadu.com ([91.218.175.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM146-005x39-13
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 06:53:39 +0000
Date: Wed, 19 Jul 2023 16:52:46 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689749609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lc9Aiu6PXaiP7fZ39vLAvDfId+QeqHYOYEE/jCSgr4k=;
	b=EutD7K3D+v5ucF4MRVCpzb04OEpQRUCikJigDSzA0eiUMOjhsaODcLGcBPF0AnKQMvVhld
	ljLrR5rUxmrMGH/m1UzntBC/fvc5KoLQd5hZW3Lg7stDUnJuJWWaZ6iToAoQpi0/+JwATA
	DSgzmtiTVQfSsBMzBeXcILXn7f2ocQeoPXBmi+uETsZRGmZqO9CecMeOlB/dT4iS0rdGSB
	9r0dyfcR23BCxF8D2gGheOi5UxkdjBKitoKzfMErYbfoqx9i5bincWEoevHvR0csNc1WSu
	u1AjR8Ykh4OZ8R54ddMqjIxg5k10C5FcBWRpvobo8yYTsUuLhtcDsl+FUZmBnw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <ZLeIPnpQnFq1qmfF@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
 <20230718221504.GA2015343-robh@kernel.org>
 <20230718-matron-backlit-ddf56c391f8a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718-matron-backlit-ddf56c391f8a@spud>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_235338_501957_297D5F59 
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

On Tue, Jul 18, 2023 at 11:38:48PM +0100, Conor Dooley wrote:
> > The email needs to be an actual person. 'contact' doesn't appear to be 
> > one.
> 
> I don't think it is that complicated, a cursory check of the domain
> suggests that "Jookia" is a nickname & there's surely nothing wrong with
> not having your name in your email address.

Yes, this is the case. I figured contact@jookia.org was better than
jookia@jookia.org.

I generally go by my nickname online and in the open source community so
it's much more useful as an identifier in this case, but I've put my real
name here instead to make things easier on everyone.

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
