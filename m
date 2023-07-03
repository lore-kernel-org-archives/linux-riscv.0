Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08039EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTSWU9O+Jzjd5Wkf5AfNhhhCLzjDo00Ul1QHz+96/0M=; b=ZrToqgO+1LGB/B
	+sTqVWHPwntSZLQLhpGSjg+XuRmwWdeUA8R4TSUYxpVhTO0M3bHeQRHiuSU3RBNt8RggWE7XG8wtv
	y99ZLF/bY0NDF7Knc+7C+SWDs6fmEOhRmVSZpUJ+0a90M7P+LSzihQoeP/YVTIhucnJr2tvUBNYVQ
	FDBcoVEjsSS06XURZgazQvaCYyc6j4aNulE7iMEcc97Zz0pBPoc8fiDF6Vaj9HNdd2dm6R0IfzwUo
	3Ma7BKoz3Sae7XaHQBAWwwPE0KFBlL3ReU2Ixw/27Ewh1GAC3t2qBhBZcHU6mBOhp4hEySUM1LsIZ
	M92PeYvwOE7Tp8fk0+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG9gz-0097EK-31;
	Mon, 03 Jul 2023 02:53:33 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG9gw-0097CO-10;
	Mon, 03 Jul 2023 02:53:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69ed7d050so61841481fa.2;
        Sun, 02 Jul 2023 19:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688352807; x=1690944807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhyBGVQ1gaH5Dq33+rfxBQOlHqFL4drvkmIj6aJ3EDI=;
        b=O1hWsfHy6op+iJK7RchZka3HezdQVlH4vq5oZ4Ax4HtYBJHdp7SiTUlOd/0MeGRlXW
         qD/ZIYJ7S7K1mp3qOnr6kToxa76JlnRwNUBFg8F1baXgmRqJNnWHdQllc+zNQ/KDquxA
         7ErHevq/QuYL5AcR4Ql1h5QzNaJ9QIQcafCqt4dGXfaEkOM3HL++icZX1GE7OHuqT4Je
         cvxgKsI/a5C0cZWpASXrd1T8JMo5yoIoj74Zs2ka04Rmp+6QnFbys2scKj3azEQXgQ2p
         1SDy5h+KL7Ty3XPYq179EooH/TEpDroawrvKxJ2iJS0i2N+UJhV225NmXPpDfy0Ly7ur
         MwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688352807; x=1690944807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhyBGVQ1gaH5Dq33+rfxBQOlHqFL4drvkmIj6aJ3EDI=;
        b=l3MKElxPGLK0p2J6TG7Um2gUlPcJUfJATjq4vDHBw2FCtj3VriLrzMwNKXOc8Xv0f4
         2yT+XJa8mM/ZWynuXtN6fUjqRUarhu5n13vS252OzQWt36p3321A5FMzXd66550fAT2y
         eqnbLNyEL7CqA6EsxDe9ARgbd8urMhPMo2g3OlgEw6Pvv+2HR4GCpd2R+go3HIlCQ9j+
         hRCG8BT1QpunwAGOSLUQzZPe3wD96vOrUecG6aVOQJmdUYSbl5c9VQc0aD0O/nPdB1HF
         qz4xJ38NRieNHmdDisN2TB37+l7zDhCbGn+zHDSMSSdfdRV6GggZPf/H3hHh8o99k/Z9
         et1Q==
X-Gm-Message-State: ABy/qLagE/qI0KdcBqQhxVdZWwNtO+ujBQkql6e7JgqwRRWihyR3PzKD
	fJdLaL0wgDERLb41grDfFwZ5Is1mwEbinlSloOM=
X-Google-Smtp-Source: APBJJlFfL2px5Y6Cyr17rNDrNo5fJ8sdzYko47a6W75rx7foKvBUjbZJAB2cC/NyOavCuc3SoyWVNmryeUVMgdKDyso=
X-Received: by 2002:a2e:9205:0:b0:2b6:e128:e7a3 with SMTP id
 k5-20020a2e9205000000b002b6e128e7a3mr2116081ljg.33.1688352806560; Sun, 02 Jul
 2023 19:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688010022.git.haibo1.xu@intel.com> <20230701-e1bff47a0ed38ec3ab6ca252@orel>
In-Reply-To: <20230701-e1bff47a0ed38ec3ab6ca252@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 3 Jul 2023 10:53:15 +0800
Message-ID: <CAJve8on_SRbPmQ4U16imMUjrqs_abLsW64xJotBxRSv65WJa-w@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] RISCV: Add KVM_GET_REG_LIST API
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_195330_356085_D36B1214 
X-CRM114-Status: GOOD (  19.41  )
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

T24gU2F0LCBKdWwgMSwgMjAyMyBhdCAxMDo1M+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdWwgMDEsIDIwMjMgYXQgMDk6NDI6
NDhQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBLVk1fR0VUX1JFR19MSVNUIHdpbGwgZHVt
cCBhbGwgcmVnaXN0ZXIgSURzIHRoYXQgYXJlIGF2YWlsYWJsZSB0bwo+ID4gS1ZNX0dFVC9TRVRf
T05FX1JFRyBhbmQgSXQncyB2ZXJ5IHVzZWZ1bCB0byBpZGVudGlmeSBzb21lIHBsYXRmb3JtCj4g
PiByZWdyZXNzaW9uIGlzc3VlIGR1cmluZyBWTSBtaWdyYXRpb24uCj4gPgo+ID4gUGF0Y2ggMS03
IHJlLXN0cnVjdHVyZWQgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGluIGFhcmNoNjQgdG8gbWFrZSBz
b21lCj4gPiBvZiB0aGUgY29kZSBhcyBjb21tb24gdGVzdCBmcmFtZXdvcmsgdGhhdCBjYW4gYmUg
c2hhcmVkIGJ5IHJpc2N2Lgo+ID4KPiA+IFBhdGNoIDggbW92ZSByZWplY3Rfc2V0IGNoZWNrIGxv
Z2ljIHRvIGEgZnVuY3Rpb24gc28gYXMgdG8gY2hlY2sgZm9yCj4gPiBkaWZmZXJlbnQgZXJybm8g
Zm9yIGRpZmZlcmVudCByZWdpc3RlcnMuCj4gPiBQYXRjaCA5IG1vdmUgZmluYWxpemVfdmNwdSBi
YWNrIHRvIHJ1bl90ZXN0IHNvIHRoYXQgcmlzY3YgY2FuIGltcGxlbWVudAo+ID4gaXRzIHNwZWNp
ZmljIG9wZXJhdGlvbi4KPiA+IFBhdGNoIDEwIGNoYW5nZSB0byBkbyB0aGUgZ2V0L3NldCBvcGVy
YXRpb24gb25seSBvbiBwcmVzZW50LWJsZXNzZWQgbGlzdC4KPiA+IFBhdGNoIDExIGFkZCB0aGUg
c2tpcF9zZXQgZmFjaWxpdGllcyBzbyB0aGF0IHJpc2N2IGNhbiBza2lwIHNldCBvcGVyYXRpb24K
PiA+IG9uIHNvbWUgcmVnaXN0ZXJzLgo+ID4gUGF0Y2ggMTIgZW5hYmxlZCB0aGUgS1ZNX0dFVF9S
RUdfTElTVCBBUEkgaW4gcmlzY3YuCj4gPiBwYXRjaCAxMyBhZGRlZCB0aGUgY29ycmVzcG9uZGlu
ZyBrc2VsZnRlc3QgZm9yIGNoZWNraW5nIHBvc3NpYmxlCj4gPiByZWdpc3RlciByZWdyZXNzaW9u
cy4KPiA+Cj4gPiBUaGUgZ2V0LXJlZy1saXN0IGt2bSBzZWxmdGVzdCB3YXMgcG9ydGVkIGZyb20g
YWFyY2g2NCBhbmQgdGVzdGVkIHdpdGgKPiA+IExpbnV4IHY2LjQgb24gYSBRZW11IHJpc2N2NjQg
dmlydCBtYWNoaW5lLgo+Cj4gSGkgSGFpYm8sCj4KPiBUaGlzIHNlcmllcyBuZWVkcyBhIHJlYmFz
ZSBvbiB0b3Agb2YgdGhlc2UgcmVjZW50IHBhdGNoZXMKPgo+ICBjb21taXQgZWUwNTNlMDNiMDhl
ICgiS1ZNOiBzZWxmdGVzdHM6IGdldC1yZWctbGlzdDogc3VwcG9ydCBJRCByZWdpc3RlciBmZWF0
dXJlcyIpCj4gIGNvbW1pdCA1ZjA0MTlhMDA4M2IgKCJLVk06IHNlbGZ0ZXN0czogZ2V0LXJlZy1s
aXN0OiBhZGQgUGVybWlzc2lvbiBJbmRpcmVjdGlvbiByZWdpc3RlcnMiKQo+Cj4gVGhlIGNvbmZs
aWN0cyB3aWxsIGJlIGluIG15IHBhdGNoZXMsIHdoaWNoIGRvIHRoZSBzcGxpdHRpbmcgb2YgdGhl
IHRlc3QuCj4gSSdsbCBkbyB0aGUgcmViYXNlIGFuZCBwdXNoIGl0IHRvIGEgYnJhbmNoIGZvciB5
b3UgdG8gcGljayB1cC4KPgoKVGhhbmtzIGZvciB0aGUgaGVhZHMgdXAuIEkgd2lsbCBpbmNsdWRl
IHlvdXIgY2hhbmdlcyBpbiB2Ni4KCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
