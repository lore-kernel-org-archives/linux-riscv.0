Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20095C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=3Ac4vyJ8NZ8OYp
	xQbEvVmft09imdVRTCVAllLz8Il9FMyliSmMfpyOyQANBJ2snFUoYMM+o4ShxIUOSQu3c79uF2nv9
	/YkUpqHF2ubQWR62h/5ItycBJ5A+x75RSfIi0KsUwTCZUfwHDqZ9AbMZdxJGCC0j4gTjTIi8+CxRI
	bmuReveVUSFjKJEcucMeEuIzWpA6D8599wvyVYN707n5ttezRJNXfLtKi8wNGwpmeVbykBITKhikv
	putmt44m3SB907uphzCCyNH+9KNFs5Y/au0lo/Ka7iZZ5DbGLP6obzKTYZjFNSOfDIVU+n7UGTdIU
	v1PF9AabYAVtYhkvSiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KCO-0000000CD9w-1PLG;
	Thu, 17 Apr 2025 08:02:16 +0000
Received: from mail.taskflame.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KCM-0000000CD8d-0lXC
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 08:02:15 +0000
Received: by mail.taskflame.pl (Postfix, from userid 1002)
	id 0C89B263BF; Thu, 17 Apr 2025 09:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskflame.pl; s=mail;
	t=1744876296; bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=MuIsPjj3OIfJivUJz5NYW1MZBfem+31XWOnOtbXzAx2bLFnn7Eu5bwzwm3KaB4Av6
	 DtbmJ1xHJa+hDxQz7M/B5TzhpIrM3cy0VEKvDb0MGX6GPAKALaKRd9k92Ocnr0AWom
	 ZBeQbokYl2N8Q9bMrboT5bStpoSg++tdo2oS5Ylb7hWw+NIj4td86/YdeiEpg8W8DK
	 qXXcnVHoN5wcBVM+6JU7KKw1Gc/SrXMlAg5wZcA64jdfffB15pjDzSuWlSq/K8HTjr
	 xPsbQMm14yR8TzogpDvTLUzPaUm4dAwVQawQYL0YHRrUSHgUOze1/Xc5gbUhsKEher
	 R9zCUqcy0paTQ==
Received: by mail.taskflame.pl for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 07:50:19 GMT
Message-ID: <20250417084500-0.1.hp.2z6uf.0.d9hi75dr16@taskflame.pl>
Date: Thu, 17 Apr 2025 07:50:19 GMT
From: "Marcin Gard" <marcin.grad@taskflame.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.taskflame.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_010214_359098_42F6362E 
X-CRM114-Status: UNSURE (  -0.31  )
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
