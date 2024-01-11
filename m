Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5204C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vL4LGcGLks77s+w3mS6gLJf3lznn2/ZcN3a6IzWpD8=; b=XBLgSSft23x9l7
	SMzE8nJQEQWnYFmWaxCCdSTAW9IhbG6eTWqIFQJs4lwHctW6SW58D0WlUquc2sjD/lYkZnC6s40lb
	cqbnRVdze7gGifBU2duhWE34GOhJC9sIIGmltLu1Y7XI6FAznG9WMehdNIHzhpq5fzXsvGgzk8XMA
	nnwOi+H7NJU+8lumLy17ywrqIdN+JK2ejJugmufv8n+Qed1qgguG1ln4eiZt0H1iOSOUtMYVlRdp/
	eWKraWGo60iGJpHJwsGrbqctUwP7JIaI7ClZ+aj1JT7WrlljHcj0nZ3zfAV9R7q/pV360s4uXUcmn
	0hCCjc1pmYChoiW4AyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwnB-000Oqh-1l;
	Thu, 11 Jan 2024 15:16:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwn8-000OpJ-0W
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 15:16:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50e7dd8bce8so6343192e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704986177; x=1705590977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPZFW6fjituFN6UJOUsGOAPd8JoXYWow7QZvMD6pj6I=;
        b=JaX4D0q2hNFg8FKD8M44plpdP0P78pNK7UmmxcuFfFCzAjh1D7iA298LzohBqeiDdF
         QViGGtc7PaxTfjhf1SMncB7TiA1UFwry9rldDZTgHi14cRabTc9fIwrpg81ZjUCu0Jxp
         xqkyg2xq3A/Vf0EenpOJAeKIQ4WX3hKDJ8i31Ib/vto/P0EqVuDEoBDvLzX9d0z/RFDG
         x90wzj24C8mPm40YDDNfEd61OuKSQvQzO3oazYx0r0EepvqeGitg0cHoLGOz91hbrB0y
         rd67kp+invN8vAoaIrQvuYP/sP9bC6FQvBI/a5RWixynIo4J84AuXH+s+kreaWDl9vbj
         r8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986177; x=1705590977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPZFW6fjituFN6UJOUsGOAPd8JoXYWow7QZvMD6pj6I=;
        b=QPunyj8SPz0p102g0feLybjVaf7PBQ7dHKI8p8WZ4vr7SufHhfGDoSEj05fW1v3ey0
         VcJiCkM+TFQroHufa+2nAluV5ujUlPfuuFsXB71P0OsrYnm2gZavoJbQwoExS0wnnOJn
         DV9WYvc2SnbnEnuA2zuOj4ZlVj8xesr0FbxVeRgSG8LxKBoE/PWkplq3fm4bKkC11pCr
         jlTAlfzIqsLE4ThSypSuER8V8sklJH61fgOLnChh5PGoJgJQeOr55iz8gizQjxnJ0kFE
         V7O5KMqSWkLq7jrJw8GfEghuMQ3TTsTZNPeQh63B/WZT5ihgS8ktOiYk2zHemQbzYPRc
         22gg==
X-Gm-Message-State: AOJu0YyZdqt5z2GhKo1tZDY5ERJ42rRgp3qqnU3GJDGz9/+eza72ALNu
	eALQgCijhOZd5ypz3nkbrzXOili54Ey/TwAVTdSt2sVEmiRxaw==
X-Google-Smtp-Source: AGHT+IEZLeQNv6vCjr34+occd/nO2c9YnZOYz4CaUUfcYXZe8yRhNltwk0drriyy4oGP+4xVoZ71xb7w9RVqI3OQj5U=
X-Received: by 2002:ac2:58d0:0:b0:50e:7709:9fc2 with SMTP id
 u16-20020ac258d0000000b0050e77099fc2mr626322lfo.78.1704986177471; Thu, 11 Jan
 2024 07:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20231221070449.1809020-1-songshuaishuai@tinylab.org> <170498463757.20080.7960935665061816471.git-patchwork-notify@kernel.org>
In-Reply-To: <170498463757.20080.7960935665061816471.git-patchwork-notify@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 11 Jan 2024 23:16:06 +0800
Message-ID: <CABgGipX7Jf7M8ZYgeRPcE9tkzc7XWpfWErsiacn2Pa9h=vG2cQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Check SR_SD before saving vstate
To: patchwork-bot+linux-riscv@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Song Shuai <songshuaishuai@tinylab.org>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, greentime.hu@sifive.com, 
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com, 
	xiao.w.wang@intel.com, heiko@sntech.de, ruinland.tsai@sifive.com, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_071622_234030_2EFCE660 
X-CRM114-Status: GOOD (  15.23  )
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

SGkgUGFsbWVyLAoKT24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMTA6NTDigK9QTSA8cGF0Y2h3b3Jr
LWJvdCtsaW51eC1yaXNjdkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhlbGxvOgo+Cj4gVGhpcyBw
YXRjaCB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1uZXh0KQoKSUlVQyB0aGUg
Y29uY2x1c2lvbiBmb3IgdGhpcyB0aHJlYWQgaXMgbm90IHRvIGNoZWNrIFNEIGJpdCBmb3IgZWl0
aGVyCnZlY3RvciBvciBmcHUuIFRoZSBwYXRjaCBmb3IgdGhpcyB3YXMgc2VudCB0b2dldGhlciB3
aXRoIHRoZQprZXJuZWwtbW9kZSB2ZWN0b3Igc2VyaWVzIGFuZCBoYXMgYmVlbiByZXZpZXdlZC1i
eSBib3RoIFNvbmcgYW5kIEd1by4KCj4gYnkgUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2lu
Yy5jb20+Ogo+Cj4gT24gVGh1LCAyMSBEZWMgMjAyMyAxNTowNDo0OSArMDgwMCB5b3Ugd3JvdGU6
Cj4gPiBUaGUgU0QgYml0IHN1bW1hcml6ZXMgdGhlIGRpcnR5IHN0YXRlcyBvZiBGUywgVlMsIG9y
IFhTIGZpZWxkcywKPiA+IHByb3ZpZGluZyBhICJmYXN0IGNoZWNrIiBiZWZvcmUgc2F2aW5nIGZz
dGF0ZSBvciB2c3RhdGUuCj4gPgo+ID4gTGV0IF9fc3dpdGNoX3RvX3ZlY3RvcigpIGNoZWNrIFNE
IGJpdCBhcyBfX3N3aXRjaF90b19mcHUoKSBkb2VzLgo+ID4KPiA+IEZpeGVzOiAzYTJkZjYzMjNk
ZWYgKCJyaXNjdjogQWRkIHRhc2sgc3dpdGNoIHN1cHBvcnQgZm9yIHZlY3RvciIpCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzb25nc2h1YWlzaHVhaUB0aW55bGFiLm9yZz4KPiA+Cj4g
PiBbLi4uXQo+Cj4gSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgo+ICAgLSByaXNjdjog
dmVjdG9yOiBDaGVjayBTUl9TRCBiZWZvcmUgc2F2aW5nIHZzdGF0ZQo+ICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3Jpc2N2L2MvZTFiNzZiYzAwZWQxCj4KPiBZb3UgYXJlIGF3ZXNvbWUsIHRo
YW5rIHlvdSEKPiAtLQo+IERlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCj4gaHR0cHM6Ly9rb3Jn
LmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAo+Cj4KClBsZWFzZSBsZXQgbWUg
a25vdyBpZiBJIG1pc3NlZCBhbnl0aGluZy4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
