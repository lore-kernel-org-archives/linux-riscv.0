Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BBEC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56gGqp40a8Tb/nscwOGvsgHvBfmJQlYW7kTLqptRDBs=; b=jpAOcC81zdTxcy
	1MzjMlGYo153uLN70BANnRghbFnH8AKUohkWKCNKYN3OV6ar+3OCitkEno2XBmZxKib0Oafl2Acce
	JsdvMWdEqiv0e5Xy93GPAK2h1aUWa2CI5y4tgGZnMaX7K+3SwxZ2VjYadHGlgYq+NEhlyAtlzfp5Y
	zIYjDD+ALAOmZ6MXT2jRuwZmBup/o9mDEzF37Cd3RJ2GriNNp9kfxH1J6ZE5KTOuvoJXOcctJmCJE
	4XboIrbxQuuwSojGTXwMiQ6qSIz0AwHvQ9bS6Mc54Pq3dPpB92qKxCjW6urXU24J4dbk+rBbmOYcN
	3RhF79os4scdI5MKO8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitFI-000000070vM-1uFN;
	Thu, 22 Jan 2026 11:53:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitFG-000000070ua-3as3
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 11:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769082781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JTm3xpnzgFJS91sLL+soLriB/Qr5GTFc7WAwtsXhWA=;
	b=KWVTmVUFt6eZNKOHqVyQ3tnYMKtdmBbNYtAH7M3E/PUMGFi//c00vf62Zw55/rnn67zN+d
	Jv4g1AmGBUWlGAR8fTBJc/RxJscSgwWp7b8k9omTGR422q12qH3NvQ2NyM6LTbu8p36jBN
	ac4538GgcxV8JcpGIm3pNsDbXeMs6xE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-OissQYvrMuG7SoCj_pEFaw-1; Thu, 22 Jan 2026 06:51:30 -0500
X-MC-Unique: OissQYvrMuG7SoCj_pEFaw-1
X-Mimecast-MFC-AGG-ID: OissQYvrMuG7SoCj_pEFaw_1769082689
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4325aa61c6bso531523f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 03:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082689; x=1769687489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JTm3xpnzgFJS91sLL+soLriB/Qr5GTFc7WAwtsXhWA=;
        b=rwP/bc3pgj4VTb7emohzd9Hecs42+L0UcQFpZ6MPrtS7VPHjcyqtTWJLJ1egu0UVwn
         lDNT6WykYbwi5W5YRDHiLo+I7rvSGA14z60/Bl/61eNcDVLnaPXn01vr2P5uDEBJqq4h
         krGb4GOTP2bGGIrAZOLxXvZoRRRc7RoXYu0R4X65U94RlaH50uVr+BEq54kwd1umkEft
         t78k7CceeJsYBg3YLL+kVs2M0Bf1e8Qb0nXBamfUnz75Kv5xw5bJDNcKQjOb9matY+VE
         fQtl3dcVXlcgQw6yv/sy7PcPo5GfVaXB23IFP0FAfWegiGAqgDNguc5pb6Y3YCbuvE2P
         TXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZHkAK2MbXvl+Bnazltw3ZEDiMJSQDaRvaHeAaJvqQ8ka4+YEZQycqO16Vx9c4S2Rv2tILxNsJJ8UFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuIIpgFyy1ViSONTjKQxhnmwxBF5fvoBpyg+TGuYSXXVN52tii
	/JvbQqk057laSTj9j2EMb9X6r8B9ARLA2yAmxiUy3PabEMf8O9MBmnB+ae1W5PJO7JpycQoAZt1
	F8wNyeHUV41ppPAgujDkjlPEvmULDAw70vd09zr6N66HKjWl52rgcNrm+bpusLt2p06CxsQ==
X-Gm-Gg: AZuq6aK5fHZuE4an8np0v+vp5LyqzEEoOLCeI6pXPB7118td3cBVYsakmf/P5WpZ/Pr
	9bWEV4AZumj51mp1h4yf+99gX3cOOMNL12XV6MZWl1UNM9kCRGETR8wTHeHb9/J31F8QJOdy7TZ
	BFi11qYeWUdHzNv7SqgXUdpzoH+lY/TOhRE+vDv6OXmV5k4FR9rb4Jxw/YJ/c8gNIcVgkibrPsY
	FM7eF8yUmRlfy/w9CfflN5J/+aiiKCRHsl6mumJvuAuxOQNCaSryV5ePvNFQGgI5JimkDdPR9dN
	AsUC7erfpnqXszo8dLhhIIeca1Zj3tYszp4k8raiVQIcNasoWlJ9xxXVVA0fn9JAyeCC01v/6d2
	vrNCyYxCNBZ4R
X-Received: by 2002:a5d:5d83:0:b0:425:769e:515a with SMTP id ffacd0b85a97d-4356a05c0bcmr32153852f8f.42.1769082689334;
        Thu, 22 Jan 2026 03:51:29 -0800 (PST)
X-Received: by 2002:a5d:5d83:0:b0:425:769e:515a with SMTP id ffacd0b85a97d-4356a05c0bcmr32153818f8f.42.1769082688972;
        Thu, 22 Jan 2026 03:51:28 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f12ee69sm21693720f8f.11.2026.01.22.03.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:51:28 -0800 (PST)
Message-ID: <d9170bdd-140f-4d36-954d-76223e31b209@redhat.com>
Date: Thu, 22 Jan 2026 12:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: spacemit: Clarify stat timeout comments and
 messages
To: Vivian Wang <wangruikang@iscas.ac.cn>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Yixun Lan <dlan@gentoo.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
 <20260121200439.64c22125@kernel.org>
 <5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QqzOU1kT1wlbj0TH-iXjUEOahPDA8UfO5CBjvZFCY7c_1769082689
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_035302_971472_C7270F7F 
X-CRM114-Status: GOOD (  22.33  )
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

On 1/22/26 11:39 AM, Vivian Wang wrote:
> On 1/22/26 12:04, Jakub Kicinski wrote:
>> On Wed, 21 Jan 2026 10:17:18 +0800 Vivian Wang wrote:
>>> This patch isn't a fix for the problem per se, since it is hardware
>>> behavior. The new message and comments, however, should direct those
>>> running into this on new hardware towards a fix.
>> Is it not possible to improve the situation?
> 
> Maybe I should have made it clearer, but this comment and messages
> improvement was proposed by Andrew in the linked thread [1].
> 
> As an aside, saying that made me realize this patch should be:
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> 
>> Is the refclock disappearing because of power saving?
>> Or because the link is down?
> 
> I'm not really well-versed in what's allowed from the PHY here, but at
> least the Motorcomm and Realtek PHYs seem to only stop this clock while
> the link is down. So from what I can tell it's PHY stopping the clock
> because of power saving for when the link is down. I'm not sure how that
> should translate into an answer to your question here...
> 
>> Because if it's the latter we should be able to skip reading the stats
>> when link is down (still racy but better than waiting in cases we can
>> detect?)
> 
> If checking the link is definitely up as a condition for updating stats
> would be acceptable, then maybe the original patch from the linked
> thread [2] can also be adopted?

My understanding is that such option would fit Jakub's suggestion. Note
that the commit message should be expanded and clarified WRT the
original submission.

/P


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
