Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F27DC04AAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 17:21:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A0120675
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 17:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ij9atkKs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BF/jOVKx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A0120675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qbGhQ7ZRxpEitD4DG28itwXfHyc4916HWbcTjijB4F4=; b=Ij9atkKsEfGKFk
	WhCzRdPymJMbcRcdPBQpki19Ivkxqi+vUni7X5snJHNkbb1QHezM1Ci7JZ1dfxB8itIDWg5iKK5Up
	xRjtkzNRNwmyMsT4vb3EopAC9pICZGMXdo/TPTD9U6+EoVyksRWK8Asmg4oSDXHUlrAe1Q2a5BVCA
	+MLsl+f/vo/AJ0vM/svBPOnLY/vxsfAzr9c0CgB0nfhO/aBnFo2NxlOxOE+Iq0oGGyVZPpsJ4ezyM
	Hs9kvfdbx0Q0a1goboHVaUVdJSgJWojROgFT6Q5JsbwHvPZUhbq/KV2bZVZ/cuJoPcsF1WBvifO8q
	cA3KTMOjVF7WeDHL+GBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlz3-00074M-CT; Mon, 20 May 2019 17:21:57 +0000
Received: from mail-it1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlz0-00073h-PD
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 17:21:55 +0000
Received: by mail-it1-x12f.google.com with SMTP id m140so254901itg.2
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=U1mBWkntXkHe1OCaEZa+jzt5Ip0fm+Wb1DlBjW6XVX0=;
 b=BF/jOVKxDvMpDHjMQlvokcMXOadG/5ViD73TuHUBrB9dtvRdjbDQVHTNnHaLJLJUs9
 WOwTsOZdjbTpyhpmzN6oT4uSumOGxigzKYt3SFVUC6R9qG8WVYh2ln5esDW1/l4nFnOv
 aRLJWCRooneNAi5N7rznzcbzXww4/UcK2zs/bZji4izYgVB3QpA4L5oAT5XMtpTLvrUE
 7WYw4NGYujkC90KXN/TWEW+eKrVe9N4MhhfaaDOwsKkC5hQ7HS9C5/Ysgc8Hcz0GvKAd
 boKSsky9t/eTRN/jK3tFfywGkm0u9yAbsPK/vvhTcYKJJMjUkSlmZEIihH9YL/hKVPFS
 qsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=U1mBWkntXkHe1OCaEZa+jzt5Ip0fm+Wb1DlBjW6XVX0=;
 b=Ekt4RK5oW5Z3DUKxoI+SYEJO9EbkQjc3+q5GETov71ZTRlMLPcyDWUVw589OLTXbeV
 XcZznnCa1Qiy+FVcu6dlnmCq4cj/hfIzvl6XRxVGFwuwGEwOKksOqmV0iAkSvoA2CndO
 EtyTU/NrMV9QG+HFBkbd3bJ8TKdSNveHC6YstmQCizUMy/z3n1gQqI3SPVQB7P7Iz35b
 LEfxjSskNVv2zc8zWNlUncCNcpzTbxqOuGNavPIkYw57xt91kwOy4wZR3F5Xg5FLOQCZ
 5Xczf+Q+MCSOYC102Ezxxxy+VzHQFYLkxFaxW63X3+Ynryk0Up6wtjOxeTx8g3QCu4Yo
 etSw==
X-Gm-Message-State: APjAAAUct1WHUcy7zkytwaD6bW1eP87mo/oOL9wa23fNix1k8RJ6uAc1
 rmWo7sKqGlqwsUQpG3ayPZhOLI1ZNg4=
X-Google-Smtp-Source: APXvYqzm9lzmDOXN1zutvigb7Iph9iyTT4n+F+YUyQlvjbxbo+bmPjFo5lSuHBq42ujfRuR40BSwvg==
X-Received: by 2002:a24:56d1:: with SMTP id o200mr115019itb.93.1558372913090; 
 Mon, 20 May 2019 10:21:53 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 v134sm56488ita.16.2019.05.20.10.21.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 10:21:52 -0700 (PDT)
Date: Mon, 20 May 2019 10:21:51 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: Patches for v5.2-rc and v5.3 merge window
Message-ID: <alpine.DEB.2.21.9999.1905201019010.15580@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_102154_847630_1626F374 
X-CRM114-Status: UNSURE (   4.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Folks,

Palmer has asked me to collect patches for the v5.2-rc releases and v5.3 
merge window, so I'll be doing so.  This is just a heads-up so no one is 
surprised to see 'patch queued' responses from me.


- Paul 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
