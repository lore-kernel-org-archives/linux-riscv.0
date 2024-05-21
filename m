Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD90C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fy6hz7jeYH4pk5PTtiQ5z1mbSazq1Tb6B9UJJ2rTvsQ=; b=GbPo6B3vBuALlO
	nZ8oxraJubNQJ/vlXmo/cFHK6PiRAullq339zqyG2NOjEwvzWcOsunNGwXYzbzjtSwApUuCg9C+YB
	5jv7AMdws/WjB9FiWWhgsSdmrMpPfg0+4fMuwUv8S4rs0YaQpBQ/AnVzxxLH+bh+mjUjzeNtGIEaH
	4Z9/q3W0T/dl6NGfL0YT7XSnfX31Wlal/WSzvNmhxjk5x7yqadFQielstqKf/jXY5kZobmFGrDXrs
	sfzqsMEVa5wPYD9kfrZP/z0bbwMPit1vd0i+HoVhl33mmcuxizpwJt4DP56A37WDxsXfI3NhXe8b5
	g8/V6m6c8QfX1LcUIbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PzR-000000004MX-2PX5;
	Tue, 21 May 2024 13:57:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PzN-000000004Gt-3NvZ
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 13:57:15 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so8837959a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716299828; x=1716904628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emM0buPGHM3Qea7pkdrtiXLfG88POGw+bVMSHXBBdtA=;
        b=eaQvmT3HV386xtkD/zxn5RtZRASvgugMZDI8fBjkCt+JxKDCo3wW7YEGXnjmFkwG+f
         ltzug2O3Hy4OcBPHQ4XoCqzxBV5ffrLioLUIOokYBxTlgqtlmB5yAPeBgsYwvQvSLb7o
         ezcb/gf9jX3hkuXPDAyX/UFxmzuteZoEjB/0YlP13OSRzcKySXhske9TOCC49Ez4MnI/
         02mnqDf4I21mEC0mCEQt2t+OugeEx4PKHmWTzU3oqeeO+fjG7dzwQC+/ks+TVUHd3kTr
         AMACFg4J/bj01aQ5/n95LZeYLCX5qL+cdheYDJ/KhqeFnPI6QLGkYzfbrQHxQNdX9vKP
         RW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716299828; x=1716904628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emM0buPGHM3Qea7pkdrtiXLfG88POGw+bVMSHXBBdtA=;
        b=X+eYxVdFKRgFV3DBs3SzQ0bwMJPubrjeD6kcqvqZWv4//QfKupUVOn9D5gkAUquLnm
         9ye2JSKuIn6YKFRg3V40WaxQJjKgNzyuUTJkG/d4+z42GK3rHSD8tEWEb1sMZC1Pla/M
         EhM2+8jUuWTdVzWMiF+f9szuyMKSbS8jQg8GbVeAYGsoJOXZwDf1jq0KmRS9zOzfsiZH
         pXqEa9iyi5DjzZYSxY0dJyTwO9qjTY4hGl7ZO33QqN4ycpf9GsLD8XaPo2z6Kiq3D0P/
         G71Tas8zTR7IQZj3yvvnqBAhYO+tIHwsKsKKMzDTQhIygDfFR/Fx8w9PTwz8nSObA9/U
         8Tzg==
X-Forwarded-Encrypted: i=1; AJvYcCVM/Yu0j5k8tAUnjnvtOe5g/j+KqZdYojrGLesmVekiNJZPqHJRFEodNUTX0JgNzz8cSfcJ1U4/mKRWiSPpzJPAWXx5vZKOKRXwIE7t9bBU
X-Gm-Message-State: AOJu0YyJ/LhpR7Semiqiha5hd7an7m6xFG/C1+1j0W8H2GIwYmWgkhC0
	Lf6ulRQZT8bl9KcJbayOiav8Ze3SjvRGbbjqbkNymMbXkEURNQ+q6s0fS4vxrCGD67XCYH0Wr4t
	xP9Nkt4pZJ8a6lgSrAcUrbKLz8UgJLezm
X-Google-Smtp-Source: AGHT+IGlrIEhEpyh0449PtWaBUIUUbn6UYoi23li4foh2VI15hVY+W7ucOK0F7C/5WROZbwXGti7tIAwaK42FPEibYA=
X-Received: by 2002:a50:d7c2:0:b0:572:7bda:1709 with SMTP id
 4fb4d7f45d1cf-5734d5904b4mr22542040a12.9.1716299827717; Tue, 21 May 2024
 06:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
 <20240519175906.138410-3-kanakshilledar111@protonmail.com>
 <171614715439.2941344.11264816105918092609.robh@kernel.org>
 <CAGLn_=tLdJU1F-i9YV5aCZQbS0L7y7Wu+_k6Dn=6HwH5JmZoMQ@mail.gmail.com> <20240520-verbally-vibes-47604636b8db@spud>
In-Reply-To: <20240520-verbally-vibes-47604636b8db@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Tue, 21 May 2024 19:26:54 +0530
Message-ID: <CAGLn_=vsFSrEi9uaZosZ6hOK5WKyOhBWvhWmz1GXz8vp9M9M9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
To: Conor Dooley <conor@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-riscv@lists.infradead.org, 
	Kanak Shilledar <kanakshilledar111@protonmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_065713_889809_13763A3B 
X-CRM114-Status: GOOD (  22.27  )
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

SGkgQ29ub3IsCgpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgpPbiBNb24sIE1heSAyMCwg
MjAyNCBhdCAxMDozNOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6
Cj4KPiBPbiBNb24sIE1heSAyMCwgMjAyNCBhdCAwMzowOTo0NFBNICswNTMwLCBLYW5hayBTaGls
bGVkYXIgd3JvdGU6Cj4gPiBPbiBNb24sIE1heSAyMCwgMjAyNCBhdCAxOjAy4oCvQU0gUm9iIEhl
cnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+CgoKCj4gQnkgInRoaXMg
cGF0Y2giIGl0IG1lYW5zIHRoYXQgaGF2aW5nIHRoZSBpbmZvcm1hdGlvbiBpbiB0aGUgY292ZXIK
PiBkb2Vzbid0IGhlbHAsIGJ1dCBpbmZvIGFib3V0IG1pc3NpbmcgZGVwcyBzaG91bGQgZ28gdW5k
ZXIgdGhlIC0tLSBsaW5lCj4gZXRjLgoKSSBhbSBzdGlsbCB1bmFibGUgdG8gZ2V0IHRoaXMgcGFy
dC4gSSBkb24ndCBzZWUgdGhlcmUgaXMgYW55IGRlcGVuZGVuY3kKb3RoZXIgdGhhbiB0aGUgdHdv
IHBhdGNoZXMgZGVwZW5kZW50IG9uIGVhY2ggb3RoZXIuIEluIG15IGNvdmVyIGxldHRlcgpJIGhh
dmUgbWVudGlvbmVkIHRoYXQgdGhlIHR3byBwYXRjaGVzIGFyZSBkZXBlbmRlbnQgb24gZWFjaCBv
dGhlci4KCj4gfCBiYXNlLWNvbW1pdDogMjBjYjM4YTdhZjg4ZGM0MDA5NWRhN2MyYzkwOTRkYTM4
NzNmZWEyMwo+IHwgcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAxNTgxNTdkMzJhMzJlNzY1ODM0YTBj
YjRmYzYzMzVmOTAwOWQ5OTYyCj4gfCBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDQwMDdjNzM4NmU2
NmY5M2I2N2EyNjMxZGRkY2EwOGNhZGNlZTcwOGIKPgo+IFRoYXQgc2FpZCwgd2h5IGRvIHlvdSBo
YXZlIHR3byBwcmVyZXF1aXNpdGUgcGF0Y2hlcz8gVGhpcyBhcHBsaWVzIG9uIHRvcAo+IG9mIDYu
OS1yYzMgd2l0aG91dCBhbnkgaXNzdWVzIChvdGhlciB0aGFuIHRyYWlsaW5nIHdoaXRlc3BhY2Ug
d2FybmluZ3MpLgoKRm9yIGdlbmVyYXRpb24gdGhlIHBhdGNoZXMgSSBhbSB1c2luZyB0aGUgY29t
bWFuZDoKYGdpdCBmb3JtYXQtcGF0Y2ggLTIgLW8gb3V0Z29pbmcvIC0tY292ZXItbGV0dGVyIC0t
YmFzZT1hdXRvYApJdCBpcyBhdXRvbWF0aWNhbGx5IGFkZGluZyB0aG9zZSB0d28gcHJlcXJlcXVp
c2l0ZS1wYXRjaC1pZHMKYXV0b21hdGljYWxseSBhbG9uZyB3aXRoIHRoZSBiYXNlLWNvbW1pdCBp
ZC4KSXMgaXQgZHVlIHRvIHRoZSBmYWN0IHRoYXQgSSBhbSBoYXZpbmcgMiBvbGRlciBwYXRjaGVz
IHdoaWNoIEkgaGF2ZQpyb2xsZWQgb3V0IGFscmVhZHk/IFNoYWxsIEkgcmVtb3ZlIHRob3NlCnBy
ZXJlcXVpc2l0ZSBwYXRjaCBpZCBmcm9tIHRoZSBjb3ZlcmxldHRlciB0byBzb2x2ZSB0aGlzIGlz
c3VlPwoKPiBBbHNvLCB5b3UgZm9yZ290IHRoZSB2MyB0YWcgb24gdGhpcyBwYXRjaHNldCwgd2hp
Y2ggY29uZnVzZXMgdG9vbGluZzoKCkkgd2lsbCBmaXggaXQgaW4gbXkgbmV4dCB2ZXJzaW9uLiBJ
IGhhdmVuJ3QgY2hhbmdlZCBhbnl0aGluZyBpbiB0aGUKcGF0Y2ggc28gSSB3aWxsIGFkZCB0aGUg
djMgdGFnIGFuZCBzZW5kIGl0LgoKPiAgICAgICAgIHNoYXphbSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDI0MDUxOTE3NTkwNi4xMzg0MTAtMS1rYW5ha3NoaWxsZWRhcjEx
MUBwcm90b25tYWlsLmNvbS9ULyN0Cj4gICAgICAgICBHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQwNTE5MTc1OTA2LjEzODQxMC0xLWthbmFrc2hpbGxlZGFyMTEx
QHByb3Rvbm1haWwuY29tL3QubWJveC5nego+ICAgICAgICAgQ2hlY2tpbmcgZm9yIG5ld2VyIHJl
dmlzaW9ucwo+ICAgICAgICAgR3JhYmJpbmcgc2VhcmNoIHJlc3VsdHMgZnJvbSBsb3JlLmtlcm5l
bC5vcmcKPiAtLS0+ICAgICAgQWRkZWQgZnJvbSB2MjogMSBwYXRjaGVzCj4gICAgICAgICBBbmFs
eXppbmcgMTAgbWVzc2FnZXMgaW4gdGhlIHRocmVhZAo+IC0tLT4gICAgV2lsbCB1c2UgdGhlIGxh
dGVzdCByZXZpc2lvbjogdjIKPiAgICAgICAgIFlvdSBjYW4gcGljayBvdGhlciByZXZpc2lvbnMg
dXNpbmcgdGhlIC12TiBmbGFnCj4gICAgICAgICBDaGVja2luZyBhdHRlc3RhdGlvbiBvbiBhbGwg
bWVzc2FnZXMsIG1heSB0YWtlIGEgbW9tZW50Li4uCj4gICAgICAgICBSZXRyaWV2aW5nIENJIHN0
YXR1cywgbWF5IHRha2UgYSBtb21lbnQuLi4KPiAgICAgICAgIFNvbWUgQ0kgY2hlY2tzIGZhaWxl
ZCwgc2VlIHBhdGNod29yayBmb3IgbW9yZSBpbmZvOgo+ICAgICAgICAgICBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2VyaWVzPTg1NDE0Nwo+
ICAgICAgICAgLS0tCj4gICAgICAgICAgIOKckyBb4pePIFBBVENIIHYyXSBkdC1iaW5kaW5nczog
aW50ZXJydXB0LWNvbnRyb2xsZXI6IHJpc2N2LGNwdS1pbnRjOiBjb252ZXJ0IHRvIGR0c2NoZW1h
Cj4gICAgICAgICAgICAgKyBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ICAgICAgICAgICAtLS0KPiAgICAgICAgICAg4pyTIFNpZ25lZDog
REtJTS9nbWFpbC5jb20KPiAgICAgICAgIC0tLQo+ICAgICAgICAgVG90YWwgcGF0Y2hlczogMQo+
ICAgICAgICAgLS0tCj4gICAgICAgICBBcHBseWluZzogZHQtYmluZGluZ3M6IGludGVycnVwdC1j
b250cm9sbGVyOiByaXNjdixjcHUtaW50YzogY29udmVydCB0byBkdHNjaGVtYQo+Cj4gVGhhbmtz
LAo+IENvbm9yLgoKVGhhbmtzIGFuZCBSZWdhcmRzLApLYW5hayBTaGlsbGVkYXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
