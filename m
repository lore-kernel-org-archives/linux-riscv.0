Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A50C98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 05:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmp4nj4xf2q1bYRW33QcQGp/oHKImSuRLePAovDpZ+8=; b=OAaN5XSvZeUHjq
	KI54nB5LR8Mf/s/wxUsa0iCLfr76yX2E9W1WRAKcvqMRM/Upe/JJJLXzoia/G7vGtMLkpAG2tSRXK
	wRbESGcjcScTyYbYRban12GMVT0qKLTLiGKL+EF3Ho1bcMczZc+xuf2yFqCOGDvEfA54oUZ7nVxXO
	nPSRlt9Rben4cE1GWhrQz5q035mjblwBeqFiiO6mjo09cSexFRuI/gKYWFFxSzJctqMf2g1LfbBkR
	t/LhRr7oh0Sgyzi5EkHZf/h04rqnDqARPtq7YqMRnEZ6+mOppFYKR1/iGFBsz/vdahTf0vpcDAhBM
	lf0GCDoXPGdt0IOExzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fqo-00000007CZG-0Dgk;
	Wed, 23 Sep 2026 05:49:02 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fqi-00000007CXQ-3J8N
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 05:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=+wFBYWTN50BPqgwOPE62LNDyMYzj9FtzyJ9AasR97Kc=; 
	b=Qeok1GQVXgdvYIOKp3NODlwoaLUwEcJt1tfzdFmCPYCno90Uh4yJyLy8dLz6CLlWpKbiRv9MSRg
	9P5BF5YATaKzNSdHdEfwZ43BFho7U/J67i9IoCg4C2yt7nwWj2Zo3sCWJaLzaomu0HRkEyxH+l0FL
	0Yh/QWv3zNek+AIOKb0gkquxrijSVa6tH2yFU9gw3IiE/cY+Xrxs0L39sTTffbUThVZRx1qCJHrnd
	HMdlRnBhdyxJVp4eIO/oSw+h02NPfrzelBijUB7zSd409r2rqSd/8OBXzKlVrd2TibKLkv/oiEBkX
	8IMqVLL5RGxW2w6VcTNPWAbIST5x7ygnfm4w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x9FqX-0000000Guqf-1nBQ;
	Wed, 23 Sep 2026 13:48:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Sep 2026 15:48:45 +1000
Date: Wed, 23 Sep 2026 15:48:45 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alex Ousherovitch <aousherovitch@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
	linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v5 00/19] crypto: cmh - add Rambus CryptoManager Hub
 driver
Message-ID: <arNoPcxJqrE7BwK9@gondor.apana.org.au>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917225929.2494111-1-aousherovitch@rambus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_224856_829974_21D3F9F4 
X-CRM114-Status: UNSURE (   7.11  )
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

On Thu, Sep 17, 2026 at 03:59:09PM -0700, Alex Ousherovitch wrote:
> crypto: cmh - add Rambus CryptoManager Hub hardware crypto accelerator

Please check the Sashiko review, it is not happy with your
patches:

https://sashiko.dev/#/patchset/20260917225929.2494111-1-aousherovitch%40rambus.com

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
