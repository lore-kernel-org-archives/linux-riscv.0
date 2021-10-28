Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54D0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87CF56108F
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87CF56108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r80bK3ZviscHRCJiFBFWBb4Llk/pG1q8xWvb5DO4BOw=; b=kW4O3oQAUfJKhC
	mcsFZfabcnKcUOCzyTC/ywRt2Wrhdz2r4mUUJq70sre4xjdOC2l+xZPH0UucCOjox6mf/3lza/or1
	9h66jlY6BC/8QenKx4HZAmBMLyLDGImiPA4b3dk5AA8KLqjXgSI80T+L2G9+Io4TlUUo3yM7c8bZx
	FDedAZ3fnV7rGIFwL72o0vyMtVwEXSPuJkztgV/n0wXKsT/ssc/LTkecBw6xDBif7s4bzJ0sUI1ET
	Wq8I6fSC9IyOLzEHcj1aoxamnW89yqwFdQKCQ51bNpovuXza0pZ0lBWQOdjyu2oWPo9LEc4EZ7kXV
	B+fRss+8qymYw7WT7dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7o1-008VMV-KD; Thu, 28 Oct 2021 15:59:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7nz-008VLB-F9
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:59:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id o14so11004070wra.12
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IfAjr9+KKKwq3jZHOqs7MUPR8iCNkDuvoFjPyZqntvM=;
 b=PyfGdX5Xu7vVSY+Hs9BCdjCwI9FiBa1IyJEScsuaJItF9N350/OhCZvPJgDBPbEQwZ
 ZiKZFknB6xcMCv78U6DdjH13aJ81hsEW+K3KTejH7iyatPL9WxKiXJdI2TKIBsYATgfW
 vAdkum8G8gQA7Ya1tjmgl5QeQhDymxdZIwQ17UAkuA0vFUkntT7xBe44v5xBoU/VNUjJ
 wH5JGuD3YmKQHPL2GoBNwIZDTtD7DXSUqZvAgBIy/jRkLIWcqzhnSBvNPz48sT/IN2CJ
 7aVIvTNc2lnHFU7mj0heub2Lqj9OkEaQC+jHpUPu//rXmdYQVcfh5Z9poCd3AJ7oFIo6
 FNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IfAjr9+KKKwq3jZHOqs7MUPR8iCNkDuvoFjPyZqntvM=;
 b=XOZREdifp3+IthpzceC2XGOwTF+C+fsCMDOEOhnjXKWoGhY6wG8POVTSYlcQU+8OGX
 kazpcETDzYzLJdGBwKRGPTQpT+g0qkcMhWqAKARgl5SASr4PAE68a6S2O9Lhwk/tySrc
 iFLYwphvDe++93x0BiyOZAsQC0vuclxxGhYGVGU7PAEYBo4kVU/zV4yE7F9P70srenBl
 cAsQLyZf45bTsjzcTGd5klJPb90i9XPEv0novIcdBQLN8NAb2XIGmu5vnvCMErPOiGjn
 lWnsH2NkGEFte/9zjH8xx0twCAKZDw4ELlaH3fpdUKudOW8EuDXupVYsDFP7qLACcZ7E
 01Nw==
X-Gm-Message-State: AOAM530GfqOtstllV0nj51VD/Y4zmIiV35sHpzFCWTMhJU1xga3/HpWi
 ylFGCaRwgAJZP0OIq33eQnXNH1ZfjC+5F7WgTnKDiOHR
X-Google-Smtp-Source: ABdhPJwF/tzZNVVcXXVBs376LCifqLS0X4Jx4j7NaP5Bpe1G9itZn7ONH0knEsN4be8DkUsJZbmIMYUWJcWhlPkphpo=
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr6896008wrr.141.1635436737323; 
 Thu, 28 Oct 2021 08:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211028132041.516820-1-bjorn@kernel.org>
 <20211028132041.516820-5-bjorn@kernel.org>
In-Reply-To: <20211028132041.516820-5-bjorn@kernel.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 28 Oct 2021 17:58:45 +0200
Message-ID: <CAJ+HfNjfGfO52KQZ23pRJFZL9arSiYQvJcHJS5nwyBDW40inAw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/4] selftests/bpf: Fix broken riscv build
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_085903_534043_8172280D 
X-CRM114-Status: GOOD (  12.28  )
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

T24gVGh1LCAyOCBPY3QgMjAyMSBhdCAxNToyMCwgQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGlzIGNsb3NlbHkgcmVsYXRlZCB0byBjb21taXQg
NjAxNmRmOGZlODc0ICgic2VsZnRlc3RzL2JwZjoKPiBGaXggYnJva2VuIHJpc2N2IGJ1aWxkIiku
IFdoZW4gY2xhbmcgaW5jbHVkZXMgdGhlIHN5c3RlbSBpbmNsdWRlCj4gZGlyZWN0b3JpZXMsIGJ1
dCB0YXJnZXRpbmcgQlBGIHByb2dyYW0sIF9fQklUU19QRVJfTE9ORyBkZWZhdWx0cyB0bwo+IDMy
LCB1bmxlc3MgZXhwbGljaXRseSBzZXQuIFdvcmthcm91bmQgdGhpcyBwcm9ibGVtLCBieSBleHBs
aWNpdGx5Cj4gc2V0dGluZyBfX0JJVFNfUEVSX0xPTkcgdG8gX19yaXNjdl94bGVuLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9NYWtlZmlsZQo+IGluZGV4IGFjNDdjZjk3NjBmYy4uZDczOWU2MmQwZjkwIDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQo+IEBAIC0yNzcsNyArMjc3LDggQEAgJChS
RVNPTFZFX0JURklEUyk6ICQoSE9TVF9CUEZPQkopIHwgJChIT1NUX0JVSUxEX0RJUikvcmVzb2x2
ZV9idGZpZHMgICAgICAgIFwKPiAgZGVmaW5lIGdldF9zeXNfaW5jbHVkZXMKPiAgJChzaGVsbCAk
KDEpIC12IC1FIC0gPC9kZXYvbnVsbCAyPiYxIFwKPiAgICAgICAgIHwgc2VkIC1uICcvPC4uLj4g
c2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8uKlwpfC1p
ZGlyYWZ0ZXIgXDF8cCB9JykgXAo+IC0kKHNoZWxsICQoMSkgLWRNIC1FIC0gPC9kZXYvbnVsbCB8
IGdyZXAgJyNkZWZpbmUgX19yaXNjdl94bGVuICcgfCBzZWQgJ3MvI2RlZmluZSAvLUQvJyB8IHNl
ZCAncy8gLz0vJykKPiArJChzaGVsbCAkKDEpIC1kTSAtRSAtIDwvZGV2L251bGwgfCBncmVwICdf
X3Jpc2N2X3hsZW4gJyB8IGF3ayAne3ByaW50ZigiLURfX3Jpc2N2X3hsZW49JWQgLURfX0JJVFNf
UEVSX0xPTkc9JWQiLCAkJDMsICQkMyl9JykKPiArCgpBcmdoLCB0aGlzIG1lc3NlcyB0aGluZ3Mg
dXAuIEknbGwgc3BpbiBhIHYyIHdpdGggdGhlIGV4dHJhIE5MIHJlbW92ZWQuCgpCasO2cm4KCj4g
IGVuZGVmCj4KPiAgIyBEZXRlcm1pbmUgdGFyZ2V0IGVuZGlhbm5lc3MuCj4gLS0KPiAyLjMyLjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
