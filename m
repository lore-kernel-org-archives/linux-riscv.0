Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71387C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=awvwc29Lyt6yJI
	BWmoO5Nhq3psiqcjcTvE/gVr3XwTes/HmNPuVh3mFtrYIVt1TOPrvTP8ew6PueRV7EG4pYL6jv2ja
	35vM24RNMacAWaH851f/Kq0Dqlg07uSrTkx62yO9mwYa3KLLDUGOBl8zkD1AfWSvwthsEE0UhqF61
	JC/RN7JO1MC9O9hSKHeSXxG41vOf0B3WabXaYJ45Jc1XJznTSTyuN9iM99+FRfqLOSgV4ExZ/vmxt
	bz2SKRztd1E4frgMpIo1wg03Dk6+8/+u/woMhbW2Y0q1LraWZuZ921WD91CpUkVIFB+pEA499QJXl
	ZUjtvDcEVLtpY6oiaeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5S3-0000000Cxkx-3yRn;
	Fri, 28 Mar 2025 08:52:31 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5S0-0000000CxkB-3bKK
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 08:52:30 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 5DC4E25496; Fri, 28 Mar 2025 09:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1743151618;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=a3lZS/mzPTrwG4CQqSB2MPhFvHgB9IdNFkmyCQnfKlWFi5hJxyDLzqIc4gLMRq/Ii
	 /PB74Nkg1oIKEIf2d18ycBoyg3Zdb8ImL+2vEBootjsrnqg+OLGxQTpUt2N0EtQzEX
	 NRzb26rUkee6j5iUHW8Mmqi6Fpxd0anVp9v6xnhpqk8bRIKLxjAYyGRiJCaI5yQLek
	 5GkiG2mxrtMVqKDFi+lM4toTHo+OKoadgt4hNn9mJRcCODvpg5NgD0PoCtisEKEt5A
	 ldUfybG9pdlirjXXREauwEa/zvR8P9mZhLhNFYFQ3E44DvwHju8KjCugDG9WBfcnL0
	 CkKUWQlRjp2UA==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 08:45:28 GMT
Message-ID: <20250328084500-0.1.hb.2t7so.0.cvci63mi7n@completesolutions.pl>
Date: Fri, 28 Mar 2025 08:45:28 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_015229_573961_837EAA53 
X-CRM114-Status: UNSURE (   1.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
