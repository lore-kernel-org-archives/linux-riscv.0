Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474F5C433B4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 02:43:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5210611CE
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 02:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5210611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p9BoMhJfyXCxewxe4FqT0iDrPkJuPgKMplaLF1n+3nI=; b=NOVBCtDoAmUb98B+zQqQ8xOnr
	qZ5NAvF4V3UQaJoUqKgPvRnbPclzE5RvX5BOHnNS0VMTMNLReUEDKE3KPgb1/xXD0iEkArs6wySXZ
	EOkDVs8ySK1g1niThvF14H+hwxGO022Z9QP5IpzQNxFJyxD/btPKtYOIRFjaZhZwUT/OcBbuqywZp
	DUK/xE+jb3M0j9PWBQ5PDXtAxXSJQHaCQvS9G5MPIz/H9PH1Qu5d60tLWPGdcmJ5AlCIusGTWMc6e
	qxocwP2xelJ8fepGHxnKp6j5WB0lrSqLUV/eu3Dq7+hpUtuv++FOEHrD4MkhDCpThaqm5xnwrfK6F
	q53FCqrHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ld23z-00B3Dw-02; Sun, 02 May 2021 02:42:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ld23k-00B3B3-Hw; Sun, 02 May 2021 02:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Date:Content-Type:References:In-Reply-To:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=JkP5DT96c2+5IIvPe8vfK9Q+r4Ize1iO0YEu/Wqrc7Q=; b=VTzIqkd9G8srw+VeUjWJVIzc47
 Gl7OOiQJREJJyNFCWKkMt8hhgw1XHKbx0VZmjgQjdDxvJyR1zO82p1SI3dk7OZp5Ea7q7IjGnPRt+
 3+iA3h047LtUv8W6GipLyN3vpPEFo5KTP8HeN0Y629jM0jM1AQo6yMrowQ7UtQ3a4XvcikCCu/wF4
 b2jok8x5UCyteeL/vg0V/dozO+nAhq6SNYNmvfHNv31V/3Z0Le6ne8ox6HYLgtAluh5IkACCSkP8e
 WfjN5SDVgukjREz4g7paCMZQ3jY+ThSDgqYnaRNsBOrBkEZSIjOsVvFRa/IHc9VaLE/Af1YfO5Z2Q
 NJGQ+eVw==;
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ld23h-002E2p-Gy; Sun, 02 May 2021 02:42:14 +0000
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 2E2581822186F;
 Sun,  2 May 2021 02:42:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf20.hostedemail.com (Postfix) with ESMTPA id 0D7D518A5F1; 
 Sun,  2 May 2021 02:42:04 +0000 (UTC)
Message-ID: <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From: Joe Perches <joe@perches.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,  Catalin Marinas
 <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Date: Sat, 01 May 2021 19:41:53 -0700
MIME-Version: 1.0
User-Agent: Evolution 3.38.1-1 
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 0D7D518A5F1
X-Stat-Signature: cq9jpwmborrqawmiw8kjkakc3j6bmyct
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19KtPWcnnFB2QBxLpInpQtqjaFCZ/4pjzg=
X-HE-Tag: 1619923324-584352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_194213_663380_3C7EA2BE 
X-CRM114-Status: GOOD (  10.49  )
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

On Sat, 2021-05-01 at 17:52 +0200, Miguel Ojeda wrote:
> On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > 
> > More cleanups will be possible as follow-up patches, but this one must
> > be agreed and applied to the mainline first.
> 
> +1 This will allow me to remove the __has_attribute hack in
> include/linux/compiler_attributes.h.

Why not raise the minimum gcc compiler version even higher?

https://gcc.gnu.org/releases.html




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
