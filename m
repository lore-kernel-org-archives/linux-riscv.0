Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0864CC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 19:05:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A2E2075E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 19:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AzMBfycW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A2E2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnJswKvOa08Na3+KpRfhgh3q0G8WVTtYnL5NeICDLkY=; b=AzMBfycWycVBce
	WQvaHrmQIpNMdAnd81C8wC2V02X64AqYOIqHRzFbnreyet8Q3twL9TufpmS3f9RCH8Ctc0vhsey+M
	j64Dk9tRnqCaxOajtE9z/MHbS5dTPLyRnWeq08H4nuHl63L/j22v6MNkaLLVYriUakPPgXCwV5HYM
	AzIkZuH3G0J0qXJvp8eN3Px1hkMr5NeQtP7YfUGZOcrXhArbl1OMPqzvkLqpO+9iADlMvPLy7oxBv
	qA8oEOYB0IbZVXZe5Gg3aLBuZDI72E29bcf1jV/0pn9w5CgM8dOrjxjEZPhNi0gsOBSfDU1AHClaJ
	aRFbkItX+sDDKnOUCDWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heOr2-0003YE-2t; Fri, 21 Jun 2019 19:05:44 +0000
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heOqz-0003Xe-Jo
 for linux-riscv@lists.infradead.org; Fri, 21 Jun 2019 19:05:42 +0000
Received: by mail-qk1-f196.google.com with SMTP id x18so5189460qkn.13
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 12:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bs68w98Lk2x5fHDgGrsEkmRuP6ZkSQPkRKBlrV+oAE4=;
 b=DTgOnnau2CXeTsUjpU2NeLqpn128lzE7qG3VZOWTjKoUCVbytwnoNmxh6fwcSifWTY
 j+kYutj1jfmaGcpw/FuBdeDqIEnS9Tzaky0JJhTKMB9QGSeX0fMmk8Vsth7ummVSOUll
 Cmc4BhDnjKTaX3HIby5IYFu/pvUx4oSHxXUb1sosMunNGGoEHwJ6Mu9gGJmjUrnF/N1Q
 mICDQ/EWUJcWQP9tmRv4Dj6KVJFr6uz92GDnnQIAQoqeQcgIQ2/SHe/USoyvC9o2djUA
 uUIC7UUM9xDLeeolj0XOWtcFCvo347aiNbgA4Yt23+ZYcBNO/6/XUBaDj2Hrfs0Zwj9f
 7q+w==
X-Gm-Message-State: APjAAAU/zuoMfjUDvL1Th1owIjlAa9rSJp8E1HewOQjqkDy+JPA2vqI7
 sT+68yhom1s5NksPbJHY3O+tPAyailbqaLiSqcw=
X-Google-Smtp-Source: APXvYqwUU+VkQWpTMoIjDb5bQvxyzXXtgVkgQyvcfcc7h89W5RgD3UZ89GU3RZg0xa4iRgidvBiDZCiTuH4KdZt9JaA=
X-Received: by 2002:a37:dcc7:: with SMTP id
 v190mr112639822qki.286.1561143939732; 
 Fri, 21 Jun 2019 12:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
 <20190604101409.2078-16-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-16-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 21 Jun 2019 21:05:22 +0200
Message-ID: <CAK8P3a08f25WYP5r57JHPcZWieS2+07=_qTphLosS4M2w8F0Zw@mail.gmail.com>
Subject: Re: [PATCH 15/15] kbuild: compile test UAPI headers to ensure they
 are self-contained
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_120541_657396_6A695D48 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Michal Marek <michal.lkml@markovi.net>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Networking <netdev@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Yonghong Song <yhs@fb.com>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCAxMjoxNiBQTSBNYXNhaGlybyBZYW1hZGEKPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZToKCj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9N
YWtlZmlsZQo+IEBAIC0xMzYzLDcgKzEzNjMsNyBAQCBDTEVBTl9ESVJTICArPSAkKE1PRFZFUkRJ
UikgaW5jbHVkZS9rc3ltCj4gIENMRUFOX0ZJTEVTICs9IG1vZHVsZXMuYnVpbHRpbi5tb2RpbmZv
Cj4KPiAgIyBEaXJlY3RvcmllcyAmIGZpbGVzIHJlbW92ZWQgd2l0aCAnbWFrZSBtcnByb3BlcicK
PiAtTVJQUk9QRVJfRElSUyAgKz0gaW5jbHVkZS9jb25maWcgdXNyL2luY2x1ZGUgaW5jbHVkZS9n
ZW5lcmF0ZWQgICAgICAgICAgXAo+ICtNUlBST1BFUl9ESVJTICArPSBpbmNsdWRlL2NvbmZpZyBp
bmNsdWRlL2dlbmVyYXRlZCAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAgYXJjaC8kKFNS
Q0FSQ0gpL2luY2x1ZGUvZ2VuZXJhdGVkIC50bXBfb2JqZGlmZgo+ICBNUlBST1BFUl9GSUxFUyAr
PSAuY29uZmlnIC5jb25maWcub2xkIC52ZXJzaW9uIFwKPiAgICAgICAgICAgICAgICAgICBNb2R1
bGUuc3ltdmVycyB0YWdzIFRBR1MgY3Njb3BlKiBHUEFUSCBHVEFHUyBHUlRBR1MgR1NZTVMgXAoK
VGhpcyBjaGFuZ2Ugc2VlbXMgdG8gaGF2ZSBjYXVzZWQgYSBtaW5vciByZWdyZXNzaW9uOgoKJCBt
YWtlIGNsZWFuIDsgbWFrZSBjbGVhbgpmaW5kOiDigJgq4oCZOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5CgpBbnkgaWRlYT8KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
