Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46214E7C4FD
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6ytlDxy6ex4IQHsPw96eMPS4MjmarkyOdnjoA+hnBY=; b=xF3Scvp0rnvfSy
	zZ40FF/PVKyJlHCDYOyVIksJKi/eoyXAcnVJHW6+WdZcGKbmPvGklWqTethUVbtzI838VCEkd0d6G
	7jowYea5Gu030cw5elPGNOXMJ4mBH65tk7Uvb67Rkf/tLDaoq+Zh/pXx1HmqON4I/1ZuPfYigrX7O
	yIDx3zAzVGVhtqpY1Q09b3XnBHQfT1mCsRGvlcuRLYz8OTiKrcMQ2H+ZTbOalNuOMM9XliLGFfDLm
	t4lsaRvSFWTTwCs0Eu2RB5JAOcF8zOb28QZvxIaqpkbPABhCU7R/vFtFwkSM/JPro8QYUCSKiryd1
	Ni4+FrKLJZFobvklp+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoKWe-001kYD-0f;
	Thu, 05 Oct 2023 09:20:08 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoKWZ-001kXd-1U
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 09:20:06 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49b289adca9so297177e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Oct 2023 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696497601; x=1697102401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmCqW9/RdSqKhGNA9TKQ87Kw41v1aHc9awKHSSwaUow=;
        b=ERyzoLKmkMM1kQWwshvDdd9P/TB9EqMV8/l3sIMPd9fGKIi3IR6WYqHZKC4x43n1B+
         /NYxntbimbtOSuhy/ryisudl2o+WU5sWoyCBPxxmVW3UskNVJsaEvpKgK5rgTew43kXt
         eCTGKoCPrJCLsz7zOVdadF3Y7ILuKT7xv8hqeNQ5PDe6fvRWNr9lb+HM8n5j2mL/Y9L5
         bYvz2IB/mxZFXPCdBYhT//FeazOHmAsXRAJLcbXvdSnlcKs2W7+4ApL0ZbRtTE86vZIw
         3c/x1tMz2lroYADPXHlZIL0igWmJf9mj9OD6ZJncky1D/9RgzqbrVGiQtDQUN1+sdu4H
         1cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696497601; x=1697102401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmCqW9/RdSqKhGNA9TKQ87Kw41v1aHc9awKHSSwaUow=;
        b=UsdaWspOHWXKMqSqej8PbHqagPyJiE4GWWOmxFthNi/DYKZO2fWO3rvAWbFQQjUvd9
         q9Hx8Zju8S6PCrZNxdjF6kIpSxjaiao3OdnmSW+lf6dtEh4JUxI75tQB+cgmk7RIOG7i
         kZaRQy/0Z/DJxXcItAjH6puYZbE4vd8qbJHzvjNvWqyE6g98HvzFFBQE/sxtCGxAIyut
         8bjr209fCZJf4E3fGyuAxeu0LB+JWWcHhylPEFNa+9D4lxNQypb7Dtn9vVQL6n7gH1a0
         vY+arBeIYGh82HP7Nfa3uKsnP97g6JN4tl+VM/TsjeEGINtZbQLE5O0Jx/65kA7S40Tf
         NJOg==
X-Gm-Message-State: AOJu0Yz6OVhQV1Vh8WUphA7CL2gOwlGoqetKgTMB/5txewu1hsCRPukU
	DOvp3GKpBdFffIz6kQJCXa9ksdOID21iWztnCP4=
X-Google-Smtp-Source: AGHT+IGUrv6tiziv5lNUOurSFPVAQQfdUe8LaLIUvdzpuLVD38jauJwHQ9ABh5kenASpIGpWyVACc47Bj2BBcblpoc8=
X-Received: by 2002:a1f:6d84:0:b0:496:1bc2:ddf with SMTP id
 i126-20020a1f6d84000000b004961bc20ddfmr4465596vkc.8.1696497601021; Thu, 05
 Oct 2023 02:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231004150856.2540-1-jszhang@kernel.org>
In-Reply-To: <20231004150856.2540-1-jszhang@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Oct 2023 10:19:06 +0100
Message-ID: <CA+V-a8uTr9vMNTKJDudjCERjnW9M_wms3LtHcOcpRc2RuhbBBw@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: make ARCH_R9A07G043 (riscv version) depend
 on NONPORTABLE
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_022003_545852_B8F30AEC 
X-CRM114-Status: GOOD (  19.43  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA0OjIx4oCvUE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IERyZXcgZm91bmQgIkNPTkZJR19ETUFfR0xPQkFMX1BPT0w9
eSBjYXVzZXMgQURNQSBidWZmZXIgYWxsb2MgdG8gZmFpbCIKPiB0aGUgbG9nIGxvb2tzIGxpa2U6
Cj4gWyAgICAzLjc0MTA4M10gbW1jMDogVW5hYmxlIHRvIGFsbG9jYXRlIEFETUEgYnVmZmVycyAt
IGZhbGxpbmcgYmFjayB0byBzdGFuZGFyZCBETUEKPgo+IFRoZSBsb2dpYyBpczogZ2VuZXJpYyBy
aXNjdiBkZWZjb25maWcgc2VsZWN0cyBBUkNIX1JFTkVTQVMgdGhlbgo+IEFSQ0hfUjlBMDdHMDQz
IHdoaWNoIHNlbGVjdHMgRE1BX0dMT0JBTF9QT09MLCB3aGljaCBhc3N1bWVzIGFsbAo+IG5vbi1k
bWEtY29oZXJlbnQgcmlzY3YgcGxhdGZvcm1zIGhhdmUgYSBkbWEgZ2xvYmFsIHBvb2wsIHRoaXMg
YXNzdW1wdGlvbgo+IHNlZW1zIG5vdCBjb3JyZWN0LiBBbmQgSSBiZWxpZXZlIERNQV9HTE9CQUxf
UE9PTCBzaG91bGQgbm90IGJlCj4gc2VsZWN0ZWQgYnkgQVJDSF9TT0NGQU1JTElZLCBpbnN0ZWFk
LCBvbmx5IEFSQ0ggdW5kZXIgc29tZSBzcGVjaWZpYwo+IGNvbmRpdGlvbnMgY2FuIHNlbGVjdCBp
dCBnbG9iYWx5LCBmb3IgZXhhbXBsZSBOT01NVSBBUk0gYW5kIHNvIG9uLAo+IGJlY2F1c2UgaXQn
cyBkZXNpZ25lZCBmb3Igc3BlY2lhbCBjYXNlcyBzdWNoIGFzICJub21tdSBjYXNlcyB3aGVyZQo+
IG5vbi1jYWNoZWFibGUgbWVtb3J5IGxpdmVzIGluIGEgZml4ZWQgcGxhY2UgaW4gdGhlIHBoeXNp
Y2FsIGFkZHJlc3MKPiBtYXAiIGFzIHBvaW50ZWQgb3V0IGJ5IFJvYmluLgo+Cj4gRml4IHRoZSBp
c3N1ZSBieSBtYWtpbmcgQVJDSF9SOUEwN0cwNDMgKHJpc2N2IHZlcnNpb24pIGRlcGVuZCBvbgo+
IE5PTlBPUlRBQkxFLCB0aHVzIGdlbmVyaWMgZGVmY29uZmlnIHdvbid0IHNlbGVjdCBBUkNIX1I5
QTA3RzA0MyBieQo+IGRlZmF1bHQuIEFuZCBldmVuIGZvciByYW5kb20gY29uZmlnIGNhc2UsIHRo
ZXJlIHdpbGwgYmUgbGVzcyBkZWJ1Zwo+IGVmZm9ydCBvbmNlIHdlIHNlZSBOT05QT1JUQUJMRSBp
cyBlbmFibGVkLgo+Cj4gUmVwb3J0ZWQtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGli
cmUuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvWlJ1
YW1KdVNoT252UDFwckB4MS8KPiBGaXhlczogNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2FzOiBL
Y29uZmlnOiBTZWxlY3QgdGhlIHJlcXVpcmVkIGNvbmZpZ3MgZm9yIFJaL0ZpdmUgU29DIikKPiBT
aWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IGRyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPgpSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJzLApQcmFiaGFrYXIKCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tj
b25maWcKPiBpbmRleCA1YTc1YWI2NGQxZWQuLjEyMDQwY2UxMTZhNSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tj
b25maWcKPiBAQCAtMzMzLDYgKzMzMyw3IEBAIGlmIFJJU0NWCj4KPiAgY29uZmlnIEFSQ0hfUjlB
MDdHMDQzCj4gICAgICAgICBib29sICJSSVNDLVYgUGxhdGZvcm0gc3VwcG9ydCBmb3IgUlovRml2
ZSIKPiArICAgICAgIGRlcGVuZHMgb24gTk9OUE9SVEFCTEUKPiAgICAgICAgIHNlbGVjdCBBUkNI
X1JaRzJMCj4gICAgICAgICBzZWxlY3QgQVg0NU1QX0wyX0NBQ0hFIGlmIFJJU0NWX0RNQV9OT05D
T0hFUkVOVAo+ICAgICAgICAgc2VsZWN0IERNQV9HTE9CQUxfUE9PTAo+IC0tCj4gMi40MC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
