Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D81EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Gsuw6u/VgBIHEPrlT4q2y63Jip3tkIrpHGP4Y1ZMkc=; b=VHuzalwAEnjZw8
	D8Gm18yv4ueokFvlwoOiXkD7KfGNLXSxxDLtUykLK23+5wFet4A1O5l0Ggw13J+2McZH8uMBihbg2
	32XrN3E2YjsUjNeKh3puN/NXA78hGGMP75WiVFipj85NA9kE8pmJWsM+vnDClQ6bwmLu8604nDNyT
	/ytnOwH2TRtLBAopyR9DtkIgD6zt+eshTDfsiUx0QR5qlgRWrOcBE4GcZfbb1MSbo++9Ib8ITgOpp
	3mqePSFn1ZBfKu4SOWjr0FVSo2BcWa1op5H1V9dAnDM2PHiP/lyE7z4CRkf4CHaUZgSl+nF1voXEa
	iyItDtGbxFLdnU4MRsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3aDt-006NEq-9w; Fri, 09 Dec 2022 10:03:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3aDq-006N9o-PJ
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 10:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670580191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Unpex6/NiCsmNu3cvjnAB1nJqSua03CVH4d0B3gW9To=;
	b=iExs5NTUViP5gqvIPdS8UNb9QKMntcrtGyc9b5fAP4/y9OYzNOV3nuLiLRlWJ9u+rBasE2
	8jEYHB8OIs1yBy8ZzKbnCz3femFzklAW04iSXpKRQ9zaPH4XUP1TpGstGUL8IM/qmm7i4T
	a9GHoddRyYmKWBZ3eySehtR930cWWLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-2rh5rKxzNzO0sMjpvC5Luw-1; Fri, 09 Dec 2022 05:03:07 -0500
X-MC-Unique: 2rh5rKxzNzO0sMjpvC5Luw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 328088582B9;
	Fri,  9 Dec 2022 10:03:06 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.168])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 886292166B26;
	Fri,  9 Dec 2022 10:03:01 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Andrew Waterman <andrew@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  Vineet Gupta
 <vineetg@rivosinc.com>,  stillson@rivosinc.com,  Paul Walmsley
 <paul.walmsley@sifive.com>,  anup@brainfault.org,  atishp@atishpatra.org,
  guoren@kernel.org,  Conor Dooley <conor.dooley@microchip.com>,
  greentime.hu@sifive.com,  vincent.chen@sifive.com,  andy.chiu@sifive.com,
  Darius Rad <darius@bluespec.com>,  arnd@kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  bjorn@kernel.org,  libc-alpha@sourceware.org,
  christoph.muellner@vrull.eu,  Aaron Durbin <adurbin@rivosinc.com>,
  linux@rivosinc.com
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
References: <b1dae947-d52a-d28e-5ddc-c1ad6d29828c@rivosinc.com>
	<mhng-84ad9495-ef4b-4343-89ee-dfe45ab69ff7@palmer-ri-x1c9>
	<CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
Date: Fri, 09 Dec 2022 11:02:57 +0100
In-Reply-To: <CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
	(Andrew Waterman's message of "Thu, 8 Dec 2022 21:42:34 -1000")
Message-ID: <877cz0nbce.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_020314_929743_A95A575E 
X-CRM114-Status: UNSURE (   9.80  )
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

* Andrew Waterman:

> This suggests that ld.so, early-stage libc, or possibly both will need
> to make this prctl() call, perhaps by parsing the ELF headers of the
> binary and each library to determine if the V extension is used.

If the string functions use the V extension, it will be enabled
unconditionally.  So I don't see why it's okay for libc to trigger this
alleged UAPI change, when the kernel can't do it by default.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
