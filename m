Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8342BC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 21:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75dltLzpq1+Ww7L+oHQ1PHpfVJ3ej74a6yFbOl+/vis=; b=p7AAnwt6RT/9lC
	/MhwvFcfl1xeVsEWAYBonKrAJXY0Tu4hV6Y52SLo10uIQdj7fvwoHZVa/VdHN54Q6hEZzQ8217Lga
	aOaTI7FAAt9IO5lnIK6RJBwOu6u+xN4xpGacDYav2t/9B3rXeF1gomLtkNZE6cDW9JT7TqjCz+2he
	BA0VJ3iUPreFYSKHO8JjlM05jrdjdkSWgGKPjeXRqJGJVrmtih1GSWiV0IoP1TxsciXK+yTn7vnzR
	ZbgbMGpiAx+9Of7Klk3tIr5kAVSLXy/s2NHub7u9nDRt58PivaoPR1CYetsqPlVFpM3NGTr88r+P/
	FOtWKUQIbr+wGxqNNWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflV1-00000007wFs-1O2k;
	Fri, 03 Jul 2026 21:32:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflUz-00000007wFS-0eDZ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 21:32:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C35143E44
	for <linux-riscv@lists.infradead.org>; Fri,  3 Jul 2026 21:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6471F000E9
	for <linux-riscv@lists.infradead.org>; Fri,  3 Jul 2026 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783114356;
	bh=OKSIV0oOxnrYHCfPO5lAQhnCzHPQePBOMJ0ktW8HRY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KtXX8IuUBNhuHWxHxBTjmuPBk9hzOQ7UsQ1CE9gvBu/kMIDFo6Om3uI/27v9fejDF
	 +EVx4yFRcD+ZHGYHSXYVZZrdD4NN/AABtyOquBKTUSIeaFLSvadRobD8UUMhpLHrw0
	 fvkNRGAwgqS7RXxOwI5DWG0GAAfbEfvGiRFksz8erK7uHpTpuZSuWn/tAoEAx/C2WO
	 88OCMIKeQZOVmG2qajorm/8ZVb4ZRZWobPwoWS9swqCLPbGZVB9YV96d8g65sWN148
	 RiD56W+0SQV3jJI86Xxpjs0EONHteMV6QzKzQJsvVBtqNZ2E7uv6VZzpJWrrCp/VUv
	 yBpdVzNcTlwqA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so987396e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 14:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpJYzjWqVZYDlcuuaMBUx92G0isINyIuPRNk5bRNOjBeeo4QI+9HQzWD63G6DgTwU0GKDJ1h/YdjFrvBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywuO6m8HaPMkl0lvIG9Nu/NwNmql8i15uSe1jfa/BkCVmlo92T
	jJdLpTM1Re+FMCsMl4oiCun69Q+GchJSwvZ3ZE5vx+9WMXNzhw2Epqowe2UT9RBLeTNKl7Gjrqw
	dBVCoy+1P2XHTJUZ1/OwBGhvk/FbJH3M=
X-Received: by 2002:a05:6512:8391:b0:5ae:ba2b:b469 with SMTP id
 2adb3069b0e04-5aed5092745mr72984e87.18.1783114353971; Fri, 03 Jul 2026
 14:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com> <akdp6GAu77-ipsXA@kunlun.suse.cz>
 <87cxx4mmim.ffs@fw13> <akeIK5TRCjlKbzbp@J2N7QTR9R3>
In-Reply-To: <akeIK5TRCjlKbzbp@J2N7QTR9R3>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:32:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0Pfhx0bY9XywVkDVU-nyAbvrnf9Wr8TSkuV4hgJL=8w@mail.gmail.com>
X-Gm-Features: AVVi8CegcPVBpxUBhMgaVmjHkjMbMgWpKQVd4voTgZ2p1M7BcZ7lo9TMo7bB8LM
Message-ID: <CAD++jLn0Pfhx0bY9XywVkDVU-nyAbvrnf9Wr8TSkuV4hgJL=8w@mail.gmail.com>
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to return boolean
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org, guoren@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, luto@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org, 
	thuth@redhat.com, ada.coupriediaz@arm.com, kevin.brodsky@arm.com, 
	yeoreum.yun@arm.com, song@kernel.org, james.morse@arm.com, 
	anshuman.khandual@arm.com, broonie@kernel.org, liqiang01@kylinos.cn, 
	pengcan@kylinos.cn, ryan.roberts@arm.com, yangtiezhu@loongson.cn, 
	sshegde@linux.ibm.com, mchauras@linux.ibm.com, austin.kim@lge.com, 
	jchrist@linux.ibm.com, arnd@arndb.de, thomas.weissschuh@linutronix.de, 
	sohil.mehta@intel.com, andrew.cooper3@citrix.com, jgross@suse.com, 
	kas@kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org
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

T24gRnJpLCBKdWwgMywgMjAyNiBhdCAxMjowMOKAr1BNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+IHdyb3RlOgoKPiBCaWtlc2hlZGRpbmcgYmVsb3c7IHNvcnJ5Lgo+Cj4gSSB0
aGluayB0aGUgYmlnZ2VyIHByb2JsZW0gaXMganVzdCB0aGF0IHNlY3VyZV9jb21wdXRpbmcoKSBp
cyBhIHRlcnJpYmxlCj4gbmFtZSB0aGF0IGRvZXMgbm90IGV4cHJlc3MgdGhlIGludGVuZGVkIHNl
bWFudGljIC0tIGl0J3Mgbm90IGNsZWFyCj4gd2hldGhlciAic2VjdXJlIGNvbXB1dGluZyIgbWVh
bnMgInNlY2NvbXAgcGVybWl0IHRoZSBzeXNjYWxsIiBvcgo+ICJzZWNjb21wIGlzIGVuYWJsZWQg
YW5kIHNvbWUgc3BlY2lhbCBydWxlcyBub3cgYXBwbHkiIG9yIHNvbWV0aGluZyBlbHNlCj4gZW50
aXJlbHkuCj4KPiBJZiB3ZSdyZSBjaGFuZ2luZyB0aGUgcmV0dXJuIHR5cGUsIGl0IG1pZ2h0IGJl
IHdvcnRoIHJlbmFtaW5nIHRoZQo+IGZ1bmN0aW9uIHNvbWV0aGluZyBsaWtlOgo+Cj4gICAgICAg
ICBzZWNjb21wX3Blcm1pdHNfc3lzY2FsbCgpCgpZZWFoIHRoYXQncyB3YXkgYmV0dGVyLCBsZXQn
cyBkbyB0aGlzLgooSSBhbHNvIGhhZCBwcm9ibGVtcyB3aXRoIHRoaXMgZnVuY3Rpb24hISkKClJ1
c3R5IFJ1c3NlbCdzIEFQSSBkZXNpZ24gbWFuaWZlc3RvIHRlbGxzIHVzIHRvIGRvIHRoaXM6Cmh0
dHBzOi8vZ2lzdC5naXRodWIuY29tL21qYmFsbC85Y2QwMjhhYzc5M2FlOGIzNTFkZjEzNzlmMWU3
MjFmOQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
