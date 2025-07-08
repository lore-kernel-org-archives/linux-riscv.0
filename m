Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB92DC8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CbryNRi9ZNVt1hXnmxNOtjm8KsJ/FSgYcIgb3Nk8xUU=; b=JI+zUf/Y42egfE
	RYZXY9+5QSTB6YGt2aLBlLS0KrSSdjKpZnIlXXgJAtmisivQg0HHGgGjeW8xL6bL96c1AZY4Ak3go
	9CWF9nW78KrjH0EI88epbjSMdqqc6LIuCRlVplgt5R2Ie0HTqNw3VhFxKLH080SsEJPDP9PIc4bjM
	920kVmKfdh1umOcnzqUJrXsfCP/lixkn7oJxOVG8ftSrwOJC99GvrOvOBBpXjtDgDlvHsK5S1ikRv
	quVa43z4omK6LPscN+MNBbDwkWfNmbfu7CDFkza8uVIldJZjnUvwekK0CLY13lCS6fWrOUXelRqhq
	QCqaF8gCuWIzMS5acC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3J1-00000004gvY-3i0T;
	Tue, 08 Jul 2025 08:03:59 +0000
Received: from mail.bizovo.pl ([217.61.16.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Iy-00000004gv3-3DwV
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 08:03:57 +0000
Received: by mail.bizovo.pl (Postfix, from userid 1002)
	id 3392B8604E; Tue,  8 Jul 2025 09:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizovo.pl; s=mail;
	t=1751961342; bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=;
	h=Date:From:To:Subject:From;
	b=msBNn4qCCdG+iifcns6fW/DA8Jxr2zyXvt4wIQ+4rA4Zpf2vogS6heMmFEVPa34HK
	 nvQxLf7O9P9VIbC7YlzMtQ3PPIdC77CsMzv0fKaEJiG/bYD7wPGh4YIGEHhf83cEWi
	 VG24GPYWg06x0w9boWmRMcZlFDCkxsn1YubmWfyT0cdsdllT9refktE4p0eK/k9HzG
	 Wjk1t77o//4ZmUhZR3QYYSWLQuFn9sLxtsRjI9k82T/Aq5pD/btzEAVFUrT/nczQUJ
	 kXSvVl4TSS8Jeihf3BhhJQz0xwezUUVrCUw7k7K/lEIcnP6jTtLSZ4oMgWZ/HmNBze
	 gxc9/asKSQPbQ==
Received: by mail.bizovo.pl for <linux-riscv@lists.infradead.org>; Tue,  8 Jul 2025 07:55:28 GMT
Message-ID: <20250708084500-0.1.8u.192uk.0.e1ief047ck@bizovo.pl>
Date: Tue,  8 Jul 2025 07:55:28 GMT
From: "Wiktoria Bielaszka" <wiktoria.bielaszka@bizovo.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Zamro=C5=BCenie_ceny_energii?=
X-Mailer: mail.bizovo.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_010356_930993_1E1C7A9D 
X-CRM114-Status: UNSURE (   0.74  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSBwbGFudWrEhSBQYcWEc3R3byBvcHR5bWFsaXphY2rEmSBrb3N6
dMOzdyBlbmVyZ2lpIGVsZWt0cnljem5laiB3IHN3b2plaiBmaXJtaWU/CgpDaGNpZWxpYnnFm215
IHByemVkc3Rhd2nEhyBuYXN6xIUgb2ZlcnTEmSBYUE9ULCBrdMOzcmEgbW/FvGUgcHJ6eW5pZcWb
xIcgem5hY3rEhWNlIG9zemN6xJlkbm/Fm2NpLiBKdcW8IG9kIHRlcmF6LCBtb2fEhSBQYcWEc3R3
byB1enlza2HEhyBjZW7EmSBuacW8c3rEhSBvIDQwLDklIHcgc3Rvc3Vua3UgZG8gb2JlY25laiBj
ZW55IHVzdGF3b3dlai4gCgpOYXN6YSBwcm9wb3p5Y2phIG9iZWptdWplIGxhdGEgMjAyNSBpIDIw
MjYsIGEgc3RhcnQgd3Nww7PFgnByYWN5IGplc3QgbW/FvGxpd3kgb2QgemFyYXouIEd3YXJhbnR1
amVteSBlbGFzdHljem5lIHdhcnVua2kgdW1vd3kgKDMtNi05LTEyIG1pZXNpxJljeSksIHphcGV3
bmlhasSFYyBtaW5pbXVtIGZvcm1hbG5vxZtjaS4KCkplc3RlxZtteSBwaW9uaWVyZW0gdyBzcHJ6
ZWRhxbx5IGVuZXJnaWkgdyBjZW5hY2ggUkROIHdlZMWCdWcgVEdFIGRsYSBrYcW8ZGVqIGdydXB5
IHRhcnlmb3dlai4gUHJ6ZXogY2HFgnkgb2tyZXMgdHJ3YW5pYSB1bW93eSB6YXBld25pYW15IFBh
xYRzdHd1IGRlZHlrb3dhbmVnbyBvcGlla3VuYSwgYSBjYcWCeSBwcm9jZXMgWm1pYW55IFNwcnpl
ZGF3Y3kgaSB3c3plbGtpZSBmb3JtYWxub8WbY2kgcmVhbGl6dWplbXkgemEgS2xpZW50w7N3LiAg
CgpDaMSZdG5pZSBwb3Jvem1hd2lhbSBvIHR5bSwgamFrIG1vxbxlbXkgd3Nww7NsbmllIHpyZWFs
aXpvd2HEhyBQYcWEc3R3YSBjZWxlIGVuZXJnZXR5Y3puZS4gUHJvc3rEmSBvIHdpYWRvbW/Fm8SH
IHcgcHJ6eXBhZGt1IHphaW50ZXJlc293YW5pYS4gCgoKWiBwb3pkcm93aWVuaWFtaQpXaWt0b3Jp
YSBCaWVsYXN6a2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
