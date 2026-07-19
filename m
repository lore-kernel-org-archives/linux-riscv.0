Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32C5C4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/yHlZFbooaucARkW2oT4B2U0TGQFxkUNqRzjhJSNz8=; b=nzracJQIZTmC3R
	3nsYhjT3odZ8zVN4B9gG4Y+fwK+t4MV7sYZ6NKrO/E7R/EXJr3ELN1/waIfhwoYgqdM7OVFIUTwWj
	H7Um4A5Kt8w5hANOsOuCu9NjOWKe302xi0S+6IiDG45PZSSFLbk8/Culm+R3jDUVvpkLNhDzmubhL
	C70c8VI7k2XpJN4bLqEe+/LFag+YDfPrRsj/Dw6Hix0X2dueiz95C2t+jrDsROAwTaCzCECLmQCq2
	Hj/Z1IOjVu5IQyRrIAxbKIbr6AWc96Ea1zqo+6HZMtu3Ka5gvna2wuATodsoGvhgYIy7WAngBfWkq
	eMPu1pujWsTc8pg5suJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXS8-00000005JYG-0W7w;
	Sun, 19 Jul 2026 19:45:32 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXS4-00000005JXv-1p39
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 19:45:30 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-667ef69424bso7676806d50.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2026 12:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784490326; cv=none;
        d=google.com; s=arc-20260327;
        b=PS7Sdrw4FG3IIx+5j1GJdsKYTF+O60vuk3wftzpCOE2+X+bfwC9p90VR6WAQujG3PO
         pJDOqomLVstTviNkH5eZzCd6fYn4lArfETdLCbzQ/LK7WAFftgif27nGuy8/rvWIrBkn
         1SAPQK4R7k/KULl+X5toU27rc6UYpqvLbopfUpoRa2pJVCx+DUB/FX9lQp0WT5EAWo7h
         fGmdyM2djgFQmKQNQRAJbnpxwmd9X0wLk9xZuU2iAyEFmdgSZV8wXdcWz0PxedDWZUPg
         5Y54F55wpDJzKPwAXombv28qbdR5dtg5cAMeVgdzuwGIjkT2ewxZ6LFjZOVQpDFIaCIK
         d8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCW/8p9Fn7t72z7ayiDXwy9RgjgcbYwz48bHsjcjcIw=;
        fh=wAs3Im0tYflYikThB9VzJappeK7Uq6qDUWBWHBWTGtE=;
        b=prHPUDN6vzmgHInZr2MgexlMBbYSAm10TLGXzdR81eSgWFpwkcQk+Fwu8umgB2bqH7
         CB59m7Y5YZspF26Xtu9zT0k9f4d/8AXC+AgPFB19LDOwQpMmBjHJfxz/rkw6k636Lbj7
         fpQfkv4n1lSOHoGQtYeeBjOaSpYf+Xg9oi4UegUp8bBhH0U2nEzF5eq9zH5HgaVhstRU
         4hUEQGba9uFIiyAapa+xrQ5Mm96UboUnJUD0HkKarjbS4Uhnm1P7Q1NS5ICXaWFWNkKl
         IsjJnUjGvxMGGsSGdnPxZu7vjqKtxv3xJ9YnMhUihUNmfRdyQt/fS+1qNJusqFxyI8Ug
         ymGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784490326; x=1785095126; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCW/8p9Fn7t72z7ayiDXwy9RgjgcbYwz48bHsjcjcIw=;
        b=ewFujKQfV688t3NE5gdro1qDG/u75y/M9OznmZkAUX4AGKCctRQRJn58YpzfUofcXp
         rqLmYsSLPC/9ebNCFnZ+n3vDLOoPBLPlioP1dXyxGQJNfnplrEIhAo6w6YVS6mU36swV
         oiHpxxjuru3EFimVMcnYl0G8y69fJ7fQq85LOxxvRuIvHmV4bjPVJCEPF74C4Wgcg7wH
         vxRDiVEKazkPHi9SveDbQzaa0AK2DT7K+EqnflyJy1hD+x71CX31hc5Vsj/ik/YPw4Y6
         PZ4/cIwpMAYUbwX3jdnC1uq7kp8AWvap4jDFd9ZHUintYnJRHA+zHs1EhkrQM88kbCMm
         11ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490326; x=1785095126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCW/8p9Fn7t72z7ayiDXwy9RgjgcbYwz48bHsjcjcIw=;
        b=WW6oQDBI8bzwMlS0FGdeNSOwatBKmMXsZar3tW7utwbEgIQOutOaH3GamP8XQp/wq4
         Dn0loh73zfK1zPFnWng1aT0a61jtOKgnYZOkttBjwS5EhCWibkZUU/PJgXX/7lnagj4i
         I3ubW80O8N8ByWM7tTql729GBSjFmXZrOVC0BbGgpFfSUl48ZUjjXroPd2tiXM3vj049
         u9R/17abruaNVUUya1yeUg5W7J3IxtB33TrCOszaE01WGF2ZRzgRv4PEyaRh2yDHhFIp
         HlFDnvWEpqzTrcDB76fQdzopyfCYpJ1udLTTkWDl0jxSK1GKKEaNdeKT5pQfdv8hAPje
         ndlA==
X-Forwarded-Encrypted: i=1; AHgh+RpdYvE3vRORe1EwbqHzVJsZdEaqIRwPYu0eT6P4INClermbMDFqT5cPVLWVoihl2qSawDWtm1uvtCeSog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVrd+lE1omy8dGhg23/nWGexma8gK4mJoLDdApUHtkj0ws/xhF
	LZLYvs7K4hmbjd6xvDEeZOYil2BKHL78Am3FEmNGIvtfhr2FD/mxXRGESaLSEoprxfUofyveDeg
	JmLYLQW5IegfTL2COCjWTCvcxA/tozN2xTiCJdgVY6A==
X-Gm-Gg: AfdE7cl0gWwKOEwSniI4UjVFk7tcN7pyAmiwACd6yiUhBfW3yywmCMthF4+3tPjy66o
	xNtg31dKPqvn4wiDk7cnGTz264Ho4PhaHQSjRyGzNU6esi5anVeBEmrMqcCx1IIeu1Lu/CrX4rp
	809HmB6l1G6SRS9ky/bUd0JJxmWvVkVO4Mi5Jo8BmFpUwsCOqw8wuKBdn1LGskgHOj15sPYXEvj
	pWMbkJPpf6LltoXDy5xaIzXnndo6g6EgX7Z0moTPPjUIJcgUS4SzAsBg9wYoTsk7100s9zXMyMq
	YSZmZZ1Zk/e5ZicxESW5p07jsGzJjrtY1vQ0yUg7WHVlwJ8=
X-Received: by 2002:a53:acc7:0:10b0:667:bb60:78a5 with SMTP id
 956f58d0204a3-6683bce8a39mr2368237d50.52.1784490325858; Sun, 19 Jul 2026
 12:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260716213314.3027969-1-aurelien@aurel32.net>
In-Reply-To: <20260716213314.3027969-1-aurelien@aurel32.net>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 19 Jul 2026 14:45:13 -0500
X-Gm-Features: AUfX_mxEqgyZYEKypyXx4gej1zq8pkt4w3TINWsQX9aT6B0qN1Sg9IzP2i44kqE
Message-ID: <CAEev2e8M7hDz+d7Kb9r2crA3_5roKhgVEf3kCsZCfLXQj8g+xg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enable Bluetooth and WiFi rfkill on K3 Pico ITX
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_124528_503174_2C25810E 
X-CRM114-Status: GOOD (  11.50  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgNDozM+KAr1BNIEF1cmVsaWVuIEphcm5vIDxhdXJlbGll
bkBhdXJlbDMyLm5ldD4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGVuYWJsZXMgQmx1ZXRvb3Ro
IHRocm91Z2ggVVNCIG9uIHRoZSBLMyBQaWNvIElUWCBib2FyZCBhbmQgYWRkcyB0aGUKPiByZmtp
bGwgbm9kZXMgZm9yIEJsdWV0b290aCBhbmQgV2lGaSBzbyB0aGF0IHRoZSBkZXZpY2VzIGNhbiBi
ZSBhY3RpdmF0ZWQuCj4KPiBOb3RlIHRoYXQgdGhlIHBhdGNoIDQgaXMgb25seSB1c2VmdWwgd2l0
aCB0aGUgZm9sbG93aW5nIHBhdGNoIHNlcmllczoKPiAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3NwYWNlbWl0LzIwMjYwNzA5MDQwMDI3Ljk1ODQwMC0xLWlub2NoaWFtYUBnbWFpbC5jb20vCj4g
LSBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFjZW1pdC8yMDI2MDcwMzAyMTAyNC40OTU0MzMt
MS1pbm9jaGlhbWFAZ21haWwuY29tLwo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2Vt
aXQvMjAyNjA3MDkwNDA0MTUuOTc3Nzg0LTEtaW5vY2hpYW1hQGdtYWlsLmNvbS8KPiAtIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3NwYWNlbWl0LzIwMjYwNzE1LXJ0dzg5LXNwYWNlbWl0LWszLXYx
LTAtZTU3N2JjNjM3MDZiQG9zcy50ZW5zdG9ycmVudC5jb20vCj4KPiBBdXJlbGllbiBKYXJubyAo
NCk6Cj4gICByaXNjdjogZGVmY29uZmlnOiBlbmFibGUgUkZLSUxMIGFuZCBSRktJTExfR1BJTwo+
ICAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGszOiBhZGQgcmZraWxsIG5vZGUgZm9yIEJsdWV0b290
aCBvbiBQaWNvLUlUWAo+ICAgICBib2FyZAo+ICAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGszOiBh
ZGQgVVNCMyBCIGFuZCBDIGNvbnRyb2xsZXJzIGZvciBQaWNvLUlUWAo+ICAgICBib2FyZAo+ICAg
cmlzY3Y6IGR0czogc3BhY2VtaXQ6IGszOiBhZGQgcmZraWxsIG5vZGUgZm9yIFdMQU4gb24gUGlj
by1JVFggYm9hcmQKPgo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpY28taXR4
LmR0cyB8IDMyICsrKysrKysrKysKPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5k
dHNpICAgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2NvbmZp
Z3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICB8ICAyICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCA5
OSBpbnNlcnRpb25zKCspCgpUZXN0ZWQtYnk6IEFuaXJ1ZGggU3Jpbml2YXNhbiA8YXNyaW5pdmFz
YW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4KCj4KPiAtLQo+IDIuNTMuMAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
