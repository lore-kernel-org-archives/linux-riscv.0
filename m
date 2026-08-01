Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD5EC5516F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4z6E4da93bjIH8duvGi2hgZBMXU+TiMEeakdjmPrbUo=; b=2Fx08bBemYUf2L
	g9sRVyW44i3AzRUCZAmBXtQglaenwVKWtJqbji1WnEFegdS28SzLtX+NsC75TPaq2QOjNH+IgRDts
	2lE5J/0STnvJALdsiW1pqQ9ldsofL5Zx1wdNA042u0MmKZs1WgY4dEnuTnPBlGHeb5YMUwoR7iW4E
	+9E3mhKMqI+bWH6JSBZBHCkM+hI1ehpIJ+E3mhfFH06nQvuBaE8x4Zj4HY1CH66qk+Hv1LSZkdiCt
	X2fJnoR7zgN3hAP5EzYJ3UUgvUSNXDJIPtts7C8I7bV1Q3QcWP70/PM8g0IcLztNM381ownIqMaoL
	10S7XXHkzd5TRU2Adzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3Ld-0000000Dx1n-2txB;
	Sat, 01 Aug 2026 06:37:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3Lc-0000000Dx0z-0WkI
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 06:37:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49553515a8bso7169615e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jul 2026 23:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785566246; cv=none;
        d=google.com; s=arc-20260327;
        b=d7DFMkD26YPCDiXxsXjV9pO2Y+NbCiEURMkx6pyPWKoq1FFS5Jh+c2wiPr9zJtAcFG
         N2a8pm1M3eVbukh1rugfVtzSXGTeM1Bd1M3xUqmcSeFWg5tcw203ue7cxacXEbCgY0dP
         ph4AI7QZ0qVCM53s+nZYUi/LmBvQn37ApvDOpKTIlx2XBBO7LCWe6EjCo0wAuYgMT0Yl
         xi+LoEJl753VE/71pfVnAfsEmEWigTmbnTdEKO4wM1V9CMtS//lgOv5X80J9nJLC3tjk
         PPeP8fNfVh1ildkDXWZE2NzNNziTr/zxOXV1EEFzrOtuIsMb/cNQi3+5WxEkJnHlAPXC
         uNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEEKMLrjFoxO4qfPv7PbynqOhcso35VDiGgwdeu5AIA=;
        fh=Wi54tmw8iCkCsjvHsAIPF4fG7ZmOtJfuux/T7pOHL3A=;
        b=qsdpi9TZ+n2OCY0lzig//i47S+F0TCh6mNXi51TX1q2Q3RnGIGS3FNlxkIERUdsfAs
         aQwRHJtMSTM2D9aOeCpi/8DZzx+iWPmBE5X/1KOVCTGzbyhi71Wbmey0ivtrfSgH43MV
         dCF+QMtLdnVKylbySLK9Ac2REB+HQGIIMX2Fb7Q5VUZqdG4PPmXs38n2eeC9xxGndXnY
         FQhzJ9/6P7HnMnV/Up5FyDFnYrd5PEZRGrh/92D12UN/YWKiBKx+1OHer2fON5jg5Zj0
         SMKUDJThAxxkdZ3uXNQO9Y7uC0K2Rz1EWnDtdmS6sJyhZ2J2NQguOHPEIshEf8T35EDu
         B4KQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785566246; x=1786171046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEEKMLrjFoxO4qfPv7PbynqOhcso35VDiGgwdeu5AIA=;
        b=eNFMA/WybqaKXfSSRl0mp/CBoRsO3HdXTN/4qy1U4TSnfdxYXVtYkF3xqbXMCgne4l
         qmdoIsX1ufQT4ZcXfpZs3iaqoGMre7Xku7gVpN3Ws02ybds6S2CuegvYk/4igF9Arkr6
         auDJ0UrFlL05R8mxuWIDpcDyuSOuSWx34f+ESl8AZNwN63UQr34J4CJlHNZlGhphVlhf
         lIpu/aicbGUFYiXYuxGoLDaiOAJLDhryTcIhbWicgepXmas+KqJwidnDxYvVww9MsVxJ
         hfltTbRj5J7bAUE3j02TONzgDNQR9QNzQ5ECDD06t6Ot4Bwwu7vbjVHNZX451rCaJxBe
         LrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566246; x=1786171046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEEKMLrjFoxO4qfPv7PbynqOhcso35VDiGgwdeu5AIA=;
        b=liPJjFCy8S1HLWGQzTlF4cZQAEARdQYhfXEdS/MiBZ3/QYFetHEw94F+JhkQK5+k8S
         UMPWsQL5ZR7yq3kO/uD9UbWSdL8iwv1YRQKQ8ZXOfE18vhj8HjJPLmSLtLEItOUXPGPw
         OXdm7TUWfbv4PsIQ0333aTe7p4nodVMXRlWtCzYiWRobFG5yfC3cTLdOUQIx7jW5Bo+W
         7bwBu3m+xjVJgN8mRhGqHmsRrWygltLmiiwkV4z9KuDOPu/naLgjtTLmF42j3006k6TH
         nrRwXab7H0NZ3Sxz3K6+FaroCkfLs7bXnlkVVo5LPCW/fB8xujozLaOfKLnnQcvaxYF4
         2Pzg==
X-Forwarded-Encrypted: i=1; AHgh+Rp22pEeG/6d182dbgsapla0Mwibnr+9MM22lbEYwN4c4dD33ZB6nxRSC+Gn/5HOChHkkOdjfx2a8iB6YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrZzBTamvXf6ceVarIL5xDzLYXsutTGvZ+4PCH/QwUtxArhb2x
	4Qwy6JajEzDbw+dJyrtnBQpB8RNF/zqfIDmOOBur5+1Mr80bGTexJ8eQ3c1QzWhouDXQ+ekDEPw
	vsViHz2sFP1p0r4BhShJlaT07UK0Z9tlYCIW/7mXp3w==
X-Gm-Gg: AR+sD10a5r+PohYV4ZCttQEzWVuuu3/2imz3RJ1ezJWghIsg6EbRvtM2C3EISBw+PTy
	n1Ise+KcQR2Q/k4pcxOBd5OCohwjuhZ/zIQRq5EIiLVNK6qNrtZ9IcCGnZSjU4jFDJIvbIM49Ro
	1Hzo/tqRK+MP/jj+zhEbFaeU9ggws3MIv7/LQN4NJ1yFp2ZT7AgCGSm3Av6V2//vouPpnxJjyRx
	/Ms4iByeRCe6k9ug8Ntqh/EMUjoGCnLA+XetW59awULfJ2wS1Mbvy+q/4x/W14xA5isbnzeW6F7
	saIj7rXXd1zRvc0j/JjcVkh95XWV6rXk/Do0EjBkqh/yagVKgb248WOmi1abfcEuQNptAI1E0bl
	cvc1K4O/dRlom1ruXTnnHHXtdxJFzPSF+s80r+ZpxvvgLhFzALqe1WmWRVx4lhcxKcBr/83gaoD
	4=
X-Received: by 2002:a05:6000:29d5:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-47fd72a8ee0mr3499962f8f.4.1785566245613; Fri, 31 Jul 2026
 23:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260731091215.1549430-1-wang.yechao255@zte.com.cn> <20260731091215.1549430-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731091215.1549430-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 12:07:14 +0530
X-Gm-Features: AUfX_mz71aCqhPqjPcVLhtR6XkG82Dg8vgNGUVKpq_m_RdgeZktITFDomZMeZYo
Message-ID: <CAAhSdy1d_7w4vJS9CfuSJg6o9CYgnn8j-Bky-KtcCwuP2oo0Hw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] RISC-V: KVM: Add the split page cache for ioctl context
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_233728_175990_CD6F0F29 
X-CRM114-Status: GOOD (  14.36  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMjo0NuKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IEFkZCB0aGUgc3BsaXQgcGFnZSBjYWNoZSBmb3Ig
ZGlydHkgbG9nZ2luZyBlbmFibGVtZW50IGFuZCB0aGUKPiBLVk1fQ0xFQVJfRElSVFlfTE9HIGlv
Y3RsLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5j
b20uY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgfCAzICsrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaAo+IGluZGV4IGUyZDU4MDgxNjllNDQuLjcxZTQ1NWQxNjY5MDUgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTg2LDYgKzg2LDcgQEAgc3RydWN0IGt2bV9hcmNo
IHsKPiAgICAgICAgIHBnZF90ICpwZ2Q7Cj4gICAgICAgICBwaHlzX2FkZHJfdCBwZ2RfcGh5czsK
PiAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGdkX2xldmVsczsKPiArICAgICAgIHN0cnVjdCBrdm1f
bW11X21lbW9yeV9jYWNoZSBwZ2Rfc3BsaXRfcGFnZV9jYWNoZTsKPgo+ICAgICAgICAgLyogR3Vl
c3QgVGltZXIgKi8KPiAgICAgICAgIHN0cnVjdCBrdm1fZ3Vlc3RfdGltZXIgdGltZXI7Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBp
bmRleCA4YTBhYTVlMGUyMTZlLi4yMDE3ZDI5MmY0Y2E3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjc3LDYgKzY3
Nyw3IEBAIGludCBrdm1fcmlzY3ZfbW11X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAg
ICAgICBrdm0tPmFyY2gucGdkID0gcGFnZV90b192aXJ0KHBnZF9wYWdlKTsKPiAgICAgICAgIGt2
bS0+YXJjaC5wZ2RfcGh5cyA9IHBhZ2VfdG9fcGh5cyhwZ2RfcGFnZSk7Cj4gICAgICAgICBrdm0t
PmFyY2gucGdkX2xldmVscyA9IGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gKyAg
ICAgICBrdm0tPmFyY2gucGdkX3NwbGl0X3BhZ2VfY2FjaGUuZ2ZwX3plcm8gPSBfX0dGUF9aRVJP
Owo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IEBAIC03MDQsNiArNzA1LDggQEAgdm9pZCBr
dm1fcmlzY3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPgo+ICAgICAgICAgaWYgKHBn
ZCkKPiAgICAgICAgICAgICAgICAgZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwZ2QsIGdldF9v
cmRlcihrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9zaXplKSk7Cj4gKwo+ICsgICAgICAga3ZtX21tdV9m
cmVlX21lbW9yeV9jYWNoZSgma3ZtLT5hcmNoLnBnZF9zcGxpdF9wYWdlX2NhY2hlKTsKPiAgfQo+
Cj4gIHZvaWQga3ZtX3Jpc2N2X21tdV91cGRhdGVfaGdhdHAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+IC0tCj4gMi4zOS4zCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
