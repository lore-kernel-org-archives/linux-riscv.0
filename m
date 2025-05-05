Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A793C3ABB6
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SG4WtirzuSD7ptsFGIEEwv/7+qBm28zHR/ERY2LxwPY=; b=hy9JRhdTKkbAjM
	p2zlXDtecCp4t8qjxytMqyHD6rfyYQC9W1KUlGXRmDJcjo1kwKlQK53zCH9ZEjaMp/22v94LXgXkL
	0g8ptJieuRpKELLbEt7ZcEYXtJfYhmTuPMkv9dA59B3R/NlgeeCFSHIfiWMqLzkCCZZ/4KTbkxXAl
	qjdb5alTQvDjpkPNWZsvxH521963h0jX0G/JUK1DmWmMY2RADD7iEp3R4GuK0p3oNyyouz5ZuBJo5
	Gd28LFM5knYZ6uzEkIASc7g6LIq9OoWnNNU6YtTgpBsjXyWxVeCTndAy4Hy96jaJ0w5LnKVblE9kn
	fQl3J59+KlTFsrJG7r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqnt-00000006jOq-03y8;
	Mon, 05 May 2025 08:03:57 +0000
Received: from mail.bizotrix.pl ([217.61.97.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqkN-00000006ihz-44kS
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 08:00:21 +0000
Received: by mail.bizotrix.pl (Postfix, from userid 1002)
	id 51B4A83BD8; Mon,  5 May 2025 09:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizotrix.pl; s=mail;
	t=1746431764; bh=lA009qM0j4YRzFUfPgrXk13BGm3QuXjamWZpOmZ+a7M=;
	h=Date:From:To:Subject:From;
	b=EIWV1wjbXu5SoHcjFT+/36Q68JPNlFz6Z48QX+/8Er66Bf4JidK32jIWzZrmqBFmZ
	 0QuA1QozcLJtMvCZgXo270QMDutZdqHnXfmcFtB4NwizfBY30Vn3uTjweEZS8ne+7U
	 y6sobpBXQq725nm0gtE4vYsiRA/Gtq8jXbb1fOhyrqPhs/3Cqv2HIYZikBLs38kqFw
	 i7gAVOWJ8mIu0OU72kh3db27wTk9FtfLgN+hqHih9EVT7pjxLNyuW9wOX2uzfxV+Yl
	 /rn6nFi2GfHQ2ih5j+I3j/TV8oDWGbufRRuxVEpt14dT7XhgDBH9LMjBm8PRXTz6Ai
	 GycRDTCQqEaMg==
Received: by mail.bizotrix.pl for <linux-riscv@lists.infradead.org>; Mon,  5 May 2025 07:55:44 GMT
Message-ID: <20250505084500-0.1.9x.k20l.0.nadktelruq@bizotrix.pl>
Date: Mon,  5 May 2025 07:55:44 GMT
From: "Filip Gerlowski" <filip.gerlowski@bizotrix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania_?=
X-Mailer: mail.bizotrix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_010020_137950_E6BFB7B1 
X-CRM114-Status: UNSURE (   0.11  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIHN0cm9uxIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KRmlsaXAgR2VybG93c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
