Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40305C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:58:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDB66126A
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECDB66126A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4WNDOaDobWu/5k/rdhPH7+0+y+lFpPprhZJjKYlZzc=; b=TK/1p5B2FGOlhP
	0Ix8umSEVl2AKekbs4/qk+g6cRdR7zsae+Kl7CHHpgoq5W0I2qU9uyX89ZzDpJO4jXS3wxpeSn3Ue
	wtKh1QR7k2mNK4VHrH9lNJzJuCDl9vYeFRfno7/O5NkPjbzFKzd5a4dozQKCEO8PgreKKvBEeIwQ6
	2Feg22U8Yk3V9YXNv7CsFCLnVBWTnQ40Y3KBaZL+YAeWGORp6ftYgAZwvchIgY8PPYJVZVVYbPDmJ
	uE7Yzr0jmpSlczuXtR784RO0K5PxuKhmZksQscuqlV3x6ioc/JkS3tu6aJK3eJiSCYlA6calhUG9s
	v95UsAlK6pJSehRP3Mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLUE-00ArBK-Mr; Thu, 23 Sep 2021 09:57:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLUC-00ArAH-10
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 09:57:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d6so15386043wrc.11
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/MJxVwGRbg1XNHDbbmS7hPzYeAHYCJbwGGA7R+iY3hA=;
 b=Rp77Ru0njGFEMH0FEC1SblZEZxv6H00mID60x2gBAsJXZsrh3KOWU8rPHIOlVNxBL0
 3ZRq07ZNjG7wsnyn5XX1Vj3a9vaCJUJwobD5+UlkffYsIWfnnQeMK5yxqdiqNQeRsL2O
 09GrDGKL3ImHMcs9KuFU7AEzX4ooYNtIn9Z8EkjjOMTSH9PuRo6HZzpQOPDmhmJTRl8y
 vlaMq0VUzrNFcZaxefQrMcXHfROfCFKkds0IHSgjQ6llIwKNUUBLZ9xu9tZlevAUMcYi
 03o+Rh4xWL57/dR4nVffQ6PU3YPqSRjsmyWL79WjrCkLQO1sWH4ChWmPmhmS1pdn9qcd
 ss4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/MJxVwGRbg1XNHDbbmS7hPzYeAHYCJbwGGA7R+iY3hA=;
 b=0HjDd8//dQAp6UBUgFrlJxy21ZmzkJ4bj7oGfph0ecsLTflb1CmGpBp55/Oistyxvr
 3x2zw0FXuQjHyl1wyDwOQvzzPm4Yyni7jn0gVRDRzgb2aCQdxChZXnehrA1whutsHEd9
 KlePLl0iGsjWEXyABu4iGEolKmQYPFghVi9EVXEuSoTeEKp1AAoH6Ycc3ZpQviaFA2Rk
 qD1dSMoHO8t0bOEnbRD1+rxumJVg+89jqUbHT7nQZ/kLjhTFkjxgnqdpYeqLDP1FnxzR
 VBKB78u19XD4Y03dhV3oYBQzwSXHms9Eb+O0q7lLC12o/5f/5VeoC+n2xLa8ptaVV8Zz
 +yBw==
X-Gm-Message-State: AOAM532SKfIrXK6G6akLt6vb/2kJmVg3ZQJ46KEK4LW6n2xhmIv2Jezf
 wuDSgfY8Gj9Rx4EM+Sq6nozGk92LNQ/xnY6vAuCyNA==
X-Google-Smtp-Source: ABdhPJy429633mcPj36zJ+Apb9XpxpDQLWxLxkJL3gUdR5i+aJK8o3tcCu6K6BPmar7CN6QU26qCVhqSRQj03KrWFPA=
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3471606wmh.61.1632391066056;
 Thu, 23 Sep 2021 02:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
In-Reply-To: <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 15:27:34 +0530
Message-ID: <CAAhSdy0eu4-iABvTnyU6HSxqbC7d--is3iZfU7Css9KWd_HTYA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Allen Baum <allen.baum@esperantotech.com>, 
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_025748_156187_AF9196DA 
X-CRM114-Status: GOOD (  19.91  )
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

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMzoxOCBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjEtMDktMjMgMTI6NDIsIE5pY2sgS29z
c2lmaWRpcyDOrc6zz4HOsc+IzrU6Cj4gPiDOo8+EzrnPgiAyMDIxLTA5LTIzIDEyOjM3LCBBbnVw
IFBhdGVsIM6tzrPPgc6xz4jOtToKPiA+PiBPbiBUaHUsIFNlcCAyMywgMjAyMSBhdCAyOjU1IFBN
IE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+Cj4gPj4gd3JvdGU6Cj4gPj4+Cj4g
Pj4+IEhlbGxvIEd1bywKPiA+Pj4KPiA+Pj4gzqPPhM65z4IgMjAyMS0wOS0yMyAxMDoyNywgZ3Vv
cmVuQGtlcm5lbC5vcmcgzq3Os8+BzrHPiM61Ogo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+Pj4gaW5kZXggZTUz
NGY2YTdjZmExLi4xODI1Y2Q4ZGIwZGUgMTAwNjQ0Cj4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4+PiBAQCAtNTYsNyAr
NTYsOSBAQCBwcm9wZXJ0aWVzOgo+ID4+PiAgICAgICBlbnVtOgo+ID4+PiAgICAgICAgIC0gcmlz
Y3Ysc3YzMgo+ID4+PiAgICAgICAgIC0gcmlzY3Ysc3YzOQo+ID4+PiArICAgICAgLSByaXNjdixz
djM5LHN2cGJtdAo+ID4+PiAgICAgICAgIC0gcmlzY3Ysc3Y0OAo+ID4+PiArICAgICAgLSByaXNj
dixzdjQ4LHN2cGJtdAo+ID4+PiAgICAgICAgIC0gcmlzY3Ysbm9uZQo+ID4+Pgo+ID4+PiBJc24n
dCBzdnBibXQgb3J0aG9nb25hbCB0byB0aGUgbW11IHR5cGUgPyBJdCdzIGEgZnVuY3Rpb25hbGl0
eSB0aGF0Cj4gPj4+IGNhbgo+ID4+PiBiZSBwcmVzZW50IG9uIGVpdGhlciBzdjM5LzQ4LzU3IHNv
IHdoeSBub3QgaGF2ZSBhbm90aGVyICJzdnBibXQiCj4gPj4+IHByb3BlcnR5IGRpcmVjdGx5IG9u
IHRoZSBjcHUgbm9kZSA/Cj4gPj4KPiA+PiBBY3R1YWxseSwgIm1tdS10eXBlIiB3b3VsZCBiZSBh
IGdvb2QgcGxhY2UgYmVjYXVzZSBpdCdzIHBhZ2UgYmFzZWQKPiA+PiBtZW1vcnkgYXR0cmlidXRl
IGFuZCBwYWdpbmcgY2FuJ3QgZXhpc3Qgd2l0aG91dCBtbXUgdHJhbnNsYXRpb24gbW9kZS4KPiA+
Pgo+ID4+IEFsc28sICJzdnBtYnQiIGlzIGluZGVlZCBhIENQVSBwcm9wZXJ0eSBzbyBoYXMgdG8g
YmUgZmVhdHVyZQo+ID4+IGluZGl2aWR1YWwKPiA+PiBDUFUgbm9kZS4gSHlwb3RoZXRpY2FsbHks
IGEgaGV0ZXJvZ2VuZW91cyBzeXN0ZW0gaXMgcG9zc2libGUgd2hlcmUKPiA+PiBzb21lIENQVXMg
aGF2ZSAic3ZwbWJ0IiBhbmQgc29tZSBDUFVzIGRvbid0IGhhdmUgInN2cG1idCIuIEZvcgo+ID4+
IGV4YW1wbGUsIGEgZnV0dXJlIEZVeHh4IFNvQyBtaWdodCBoYXZlIGEgRS1jb3JlIGFuZCBmZXcg
Uy1jb3Jlcwo+ID4+IHdoZXJlIFMtY29yZXMgaGF2ZSBTdnBtYnQgd2hlcmVhcyBFLWNvcmUgZG9l
cyBub3QgaGF2ZSBTdnBtYnQKPiA+PiBiZWNhdXNlIGl0J3MgYW4gZW1iZWRkZWQgY29yZS4KPiA+
Pgo+ID4KPiA+IEkgc2hvdWxkIHNheSBjcHVYIG5vZGUsIG5vdCB0aGUgcm9vdCAvY3B1IG5vZGUu
IFdlIGNhbiBoYXZlIGFuIHN2cGJtdAo+ID4gcHJvcGVydHkgaW4gdGhlIHNhbWUgd2F5IHdlIGhh
dmUgYW4gbW11LXR5cGUgcHJvcGVydHkuCj4gPgo+Cj4gSSdtIGFsc28gdGhpbmtpbmcgb2YgZnV0
dXJlIG1tdS1yZWxhdGVkIGV4dGVuc2lvbnMsIGUuZy4gd2hhdCBhYm91dAo+IHN2bmFwb3QgPyBT
aG91bGQgd2UgaGF2ZSBtbXUtdHlwZSBiZSByaXNjdixzdjM5LHN2bmFwb3QgYW5kIGUuZy4KPiBy
aXNjdi5zdjM5LHN2cGJtdCxzdm5hcG90ID8gSXQnbGwgYmVjb21lIG1lc3N5LgoKSSBhZ3JlZSwg
Im1tdS10eXBlIiBjYW4gYmVjb21lIGxvbmdlciBpbiBmdXR1cmUgYnV0IEkgd2FzIHRoaW5raW5n
CmlmIGFsbCBNTVUgcmVsYXRlZCBmZWF0dXJlcyBjYW4gc2ltcGx5IGJlIGNvbW1hLXNlcGFyYXRl
ZCB2YWx1ZXMKb2Ygb25lIERUIHByb3BlcnR5LgoKQWx0ZXJuYXRlbHksIHdlIGNhbiBoYXZlICJy
aXNjdixzdnBtYnQiIGJvb2wgRFQgcHJvcGVydHkgaW4gZWFjaApDUFUgbm9kZSB3aGljaCB3aWxs
IGtlZXAgdGhpbmdzIHNpbXBsZXIgYXMgY29tcGFyZWQgdG8gcGFyc2luZwpjb21tYS1zZXBhcmF0
ZSBzdHJpbmcgaW4gIm1tdS10eXBlIiBEVCBwcm9wZXJ0eS4KClJlZ2FyZHMsCkFudXAKCj4KPiBS
ZWdhcmRzLAo+IE5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
