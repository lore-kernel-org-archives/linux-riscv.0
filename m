Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A86C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpTXKDGVRzMKone2wdnYCJ8f+4ttWowE9aROGSQKRgI=; b=eOwULbSGOpBeKs
	yEX9wdtSvgmr3+MZ9GzzZ+CghJyFOApK38omw7Hw/0lXGfxZf/R+nO8dpzuigs/n1Koc4hCDzIbRu
	+fDpxL4lPD4aOrImcicy2sb0rJgJHcsQ+012JRiY8nICzuSv5eo1zW7zn7cD+BQ0Wg+sLTh+c048k
	IKT1U44hpy3tvxPoo58gDJUlALmYjDaTQfsUZvb49Lcq9Mk01qat9iB1G7yxRKn1ZTNbXa8Z1JkGh
	Mtzo1dH8MqD0i4IcTxt0egV7TRRco2VgxuxBwRXHWRa/ozyziq50M3u4be/DDu9VMEhZXafYMsAkm
	k1StdSLTTCMhINidbYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueHcN-00000003Epx-1Hxk;
	Tue, 22 Jul 2025 18:21:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueHcK-00000003EpG-3ZvJ;
	Tue, 22 Jul 2025 18:21:33 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553e5df44f8so5268783e87.3;
        Tue, 22 Jul 2025 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753208491; x=1753813291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
        b=CcrzXKDpBy512Lu2Plaju7Q7RWggxWG7eOtFCG6YTp85DxrIAEEZ3JVuwOQjTMDX0S
         JDpsXJZ0EfFFHefd9we7iA7/QE4o0+ONG1ereEllIscde/uEUtsI6gAWGs7pIqXTGbOb
         cjFH/U3+0zC4VJ79+0TlJkh5KWAUhdZWvs/0/srYtTLg5DWpBaoPsymQt3GQi6Fe56Ne
         q4h8iPZdz7SHueAU6yb9c24yDY5ryCoYnsSTG2hAw64uXhlyY+UC7AEx01OX08UdUklK
         YViIUyMKVQHkiM9RUmNYWrDgvxCGoV7gBhJ7BxOiGlnO8wXINUHNknHetCN/dWE7br7i
         AUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753208491; x=1753813291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1bfHAcPl/XMz8xDguK3teTl09r5v0kLVciBst2DtbI=;
        b=tSPjdd0dSp+VJYI9+CsHIHr+lLCrpblArkSPKYmrnozrsZYiYY6Cu0LudOCY+uEJEW
         YrYXsfor5mOvJGxCCDVx2zlmbz0WA+MYQoqI/OAMiquepWbx9oVF7zQSanZuiTYsQVHL
         gPqosOoJXvgVZhMdJuAv8e1Rogx6uj0/dgBYLLDl3nzihc5scbknlzva4hZ4dwoWizrL
         FpOU0RHoFnLNEyj7i7KATVTm/9eE5sqvZiQrk1XLf9cDm07edESWPzFFlEq35ID6O+jH
         NSZgcel2GHKyiuN4jrYeVBeW/tiLM4LVWvNGvv/OLdP6B6NhcPhYtT+K3n06kzlF1nV+
         Slpw==
X-Forwarded-Encrypted: i=1; AJvYcCXdNo3nFrE74vgidASsV4lM9vP3/9iF4zAD5nOAUIjI6tlqvO5DY8LBKe4WWMT7ZH+Y5lvel368fzU=@lists.infradead.org, AJvYcCXsNPjhYtgnwbUNwCCjNwoarV9g3wuPMWqOCBrXtHKfDcf7pXGtX1y+CWn+X8I4ERabrT4Q3KasqgeXiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsFMrB8PEy3Zq6B7sTiI/o1VGa2dFNCoqKgy6Qn11zo5MldXr8
	MTT9oYD1dNNrXq1PO7pQ8Ho7lVOeMJ+zLnIuJoBom4KqD6qBIpA/6RcP3BOBkAViSZg+hwqNz74
	QbA8Aomqm8Wsmo2ej2tUFtWm1OKbl0U8=
X-Gm-Gg: ASbGncuuJR7x6Xm1+lB+VeKpfOkimFwg/bvxShwJ+XQ/ab1cjgpCMIbRVTPHwDvinBL
	YPYdQGnNPto1nFRThMsz0Qqg8HscCIlgoY4vecJDQv+n/F949uVKbOJssAd3o8JHMo01BoZEbe/
	KYvKwZj0TDtg2LKEpZSHclNcvNLyUCqQAvPvSbcBCB3MfB1/Kaxm/erQllJghZm51Iuuri6X6h3
	VMKKy8=
X-Google-Smtp-Source: AGHT+IHgqZRO4CHZDXwO8i4qviF6GOSHLcIqgaK9MAu32BIYgiKkWD327bPslpy0X0mdn5DHRJd+TcwlCu2XTW4y0IA=
X-Received: by 2002:a05:6512:4021:b0:553:2190:fef8 with SMTP id
 2adb3069b0e04-55a513998a5mr31899e87.7.1753208490745; Tue, 22 Jul 2025
 11:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
In-Reply-To: <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 23:21:13 +0500
X-Gm-Features: Ac12FXzOVMCIvnTEhZltt3TS4XKarYeDIkGkWcMAqG0GgJ62pPTw9Xni6fYiOgs
Message-ID: <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_112132_891736_400B73F4 
X-CRM114-Status: GOOD (  18.54  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgMzo1OeKAr0FNIEFuZHJleSBSeWFiaW5pbiA8cnlhYmlu
aW4uYS5hQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gNy8xNy8yNSA0OjI3IFBNLCBTYWJ5
cnpoYW4gVGFzYm9sYXRvdiB3cm90ZToKPgo+ID4gPT09IFRlc3Rpbmcgd2l0aCBwYXRjaGVzCj4g
Pgo+ID4gVGVzdGluZyBpbiB2MzoKPiA+Cj4gPiAtIENvbXBpbGVkIGV2ZXJ5IGFmZmVjdGVkIGFy
Y2ggd2l0aCBubyBlcnJvcnM6Cj4gPgo+ID4gJCBtYWtlIENDPWNsYW5nIExEPWxkLmxsZCBBUj1s
bHZtLWFyIE5NPWxsdm0tbm0gU1RSSVA9bGx2bS1zdHJpcCBcCj4gPiAgICAgICBPQkpDT1BZPWxs
dm0tb2JqY29weSBPQkpEVU1QPWxsdm0tb2JqZHVtcCBSRUFERUxGPWxsdm0tcmVhZGVsZiBcCj4g
PiAgICAgICBIT1NUQ0M9Y2xhbmcgSE9TVENYWD1jbGFuZysrIEhPU1RBUj1sbHZtLWFyIEhPU1RM
RD1sZC5sbGQgXAo+ID4gICAgICAgQVJDSD0kQVJDSAo+ID4KPiA+ICQgY2xhbmcgLS12ZXJzaW9u
Cj4gPiBDbGFuZ0J1aWx0TGludXggY2xhbmcgdmVyc2lvbiAxOS4xLjQKPiA+IFRhcmdldDogeDg2
XzY0LXVua25vd24tbGludXgtZ251Cj4gPiBUaHJlYWQgbW9kZWw6IHBvc2l4Cj4gPgo+ID4gLSBt
YWtlIEFSQ0g9dW0gcHJvZHVjZXMgdGhlIHdhcm5pbmcgZHVyaW5nIGNvbXBpbGluZzoKPiA+ICAg
ICAgIE1PRFBPU1QgTW9kdWxlLnN5bXZlcnMKPiA+ICAgICAgIFdBUk5JTkc6IG1vZHBvc3Q6IHZt
bGludXg6IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJlbmNlOiBcCj4gPiAgICAgICAgICAgICAg
IGthc2FuX2luaXQrMHg0MyAoc2VjdGlvbjogLmx0ZXh0KSAtPiBcCj4gPiAgICAgICAgICAgICAg
IGthc2FuX2luaXRfZ2VuZXJpYyAoc2VjdGlvbjogLmluaXQudGV4dCkKPiA+Cj4gPiBBRkFJVSwg
aXQncyBkdWUgdG8gdGhlIGNvZGUgaW4gYXJjaC91bS9rZXJuZWwvbWVtLmMsIHdoZXJlIGthc2Fu
X2luaXQoKQo+ID4gaXMgcGxhY2VkIGluIG93biBzZWN0aW9uICIua2FzYW5faW5pdCIsIHdoaWNo
IGNhbGxzIGthc2FuX2luaXRfZ2VuZXJpYygpCj4gPiB3aGljaCBpcyBtYXJrZWQgd2l0aCAiX19p
bml0Ii4KPiA+Cj4gPiAtIEJvb3RpbmcgdmlhIHFlbXUtc3lzdGVtLSBhbmQgcnVubmluZyBLVW5p
dCB0ZXN0czoKPiA+Cj4gPiAqIGFybTY0ICAoR0VORVJJQywgSFdfVEFHUywgU1dfVEFHUyk6IG5v
IHJlZ3Jlc3Npb24sIHNhbWUgYWJvdmUgcmVzdWx0cy4KPiA+ICogeDg2XzY0IChHRU5FUklDKTog
bm8gcmVncmVzc2lvbiwgbm8gZXJyb3JzCj4gPgo+Cj4gSXQgd291bGQgYmUgaW50ZXJlc3Rpbmcg
dG8gc2VlIHdoZXRoZXIgQVJDSF9ERUZFUl9LQVNBTj15IGFyY2hlcyB3b3JrLgo+IFRoZXNlIHNl
cmllcyBhZGQgc3RhdGljIGtleSBpbnRvIF9fYXNhbl9sb2FkKigpL19zdG9yZSooKSB3aGljaCBh
cmUgY2FsbGVkCj4gZnJvbSBldmVyeXdoZXJlLCBpbmNsdWRpbmcgdGhlIGNvZGUgcGF0Y2hpbmcg
c3RhdGljIGJyYW5jaGVzIGR1cmluZyB0aGUgc3dpdGNoLgo+Cj4gSSBoYXZlIHN1c3BpY2lvbiB0
aGF0IHRoZSBjb2RlIHBhdGNoaW5nIHN0YXRpYyBicmFuY2hlcyBkdXJpbmcgc3RhdGljIGtleSBz
d2l0Y2gKPiBtaWdodCBub3QgYmUgcHJlcGFyZWQgdG8gdGhlIGZhY3QgdGhlIGN1cnJlbnQgQ1BV
IG1pZ2h0IHRyeSB0byBleGVjdXRlIHRoaXMgc3RhdGljCj4gYnJhbmNoIGluIHRoZSBtaWRkbGUg
b2Ygc3dpdGNoLgoKQUZBSVUsIHlvdSdyZSByZWZlcnJpbmcgdG8gdGhpcyBmdW5jdGlvbiBpbiBt
bS9rYXNhbi9nZW5lcmljLmM6CgpzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgY2hlY2tfcmVn
aW9uX2lubGluZShjb25zdCB2b2lkICphZGRyLAoKICAgICAgc2l6ZV90IHNpemUsIGJvb2wgd3Jp
dGUsCgogICAgICB1bnNpZ25lZCBsb25nIHJldF9pcCkKewogICAgICAgIGlmICgha2FzYW5fc2hh
ZG93X2luaXRpYWxpemVkKCkpCiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKLi4uCn0KCmFu
ZCBwYXJ0aWN1bGFybHksIHRvIGFyY2hpdGVjdHVyZXMgdGhhdCBzZWxlY3RzIEFSQ0hfREVGRVJf
S0FTQU49eSwgd2hpY2ggYXJlCmxvb25nYXJjaCwgcG93ZXJwYywgdW0uIFNvIHdoZW4gdGhlc2Ug
YXJjaCB0cnkgdG8gZW5hYmxlIHRoZSBzdGF0aWMga2V5OgoKMS4gc3RhdGljX2JyYW5jaF9lbmFi
bGUoJmthc2FuX2ZsYWdfZW5hYmxlZCkgY2FsbGVkCjIuIEtlcm5lbCBwYXRjaGVzIGNvZGUgLSBj
aGFuZ2VzIGp1bXAgaW5zdHJ1Y3Rpb25zCjMuIENvZGUgcGF0Y2hpbmcgaW52b2x2ZXMgbWVtb3J5
IHdyaXRlcwo0LiBNZW1vcnkgd3JpdGVzIGNhbiB0cmlnZ2VyIGFueSBLQVNBTiB3cmFwcGVyIGZ1
bmN0aW9uCjUuIFdyYXBwZXIgY2FsbHMga2FzYW5fc2hhZG93X2luaXRpYWxpemVkKCkKNi4ga2Fz
YW5fc2hhZG93X2luaXRpYWxpemVkKCkgY2FsbHMgc3RhdGljX2JyYW5jaF9saWtlbHkoJmthc2Fu
X2ZsYWdfZW5hYmxlZCkKNy4gVGhpcyByZWFkcyB0aGUgc3RhdGljIGtleSBiZWluZyBwYXRjaGVk
IC0tLSB0aGlzIGlzIHRoZSBwb3RlbnRpYWwgaXNzdWU/CgpUaGUgY3VycmVudCBydW50aW1lIGNo
ZWNrIGlzIGZvbGxvd2luZyBpbiB0aXMgdjMgcGF0Y2ggc2VyaWVzOgoKI2lmZGVmIENPTkZJR19B
UkNIX0RFRkVSX0tBU0FOCi4uLgpzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wga2FzYW5fc2hh
ZG93X2luaXRpYWxpemVkKHZvaWQpCnsKICAgICAgICByZXR1cm4gc3RhdGljX2JyYW5jaF9saWtl
bHkoJmthc2FuX2ZsYWdfZW5hYmxlZCk7Cn0KLi4uCiNlbmRpZgoKSSB3b25kZXIsIGlmIEkgc2hv
dWxkIGFkZCBzb21lIHByb3RlY3Rpb24gb25seSBmb3IgS0FTQU5fR0VORVJJQywKd2hlcmUgY2hl
Y2tfcmVnaW9uX2lubGluZSgpIGlzIGNhbGxlZCAob3IgZm9yIGFsbCBLQVNBTiBtb2Rlcz8pOgoK
I2lmZGVmIENPTkZJR19BUkNIX0RFRkVSX0tBU0FOCi4uLgpzdGF0aWMgX19hbHdheXNfaW5saW5l
IGJvb2wga2FzYW5fc2hhZG93X2luaXRpYWxpemVkKHZvaWQpCnsKICAgICAgICAvKiBBdm9pZCBy
ZWN1cnNpb24gKD8pIGR1cmluZyBzdGF0aWMga2V5IHBhdGNoaW5nICovCiAgICAgICAgaWYgKHN0
YXRpY19rZXlfY291bnQoJmthc2FuX2ZsYWdfZW5hYmxlZC5rZXkpIDwgMCkKICAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKICAgICAgICByZXR1cm4gc3RhdGljX2JyYW5jaF9saWtlbHkoJmth
c2FuX2ZsYWdfZW5hYmxlZCk7Cn0KLi4uCiNlbmRpZgoKUGxlYXNlIHN1Z2dlc3Qgd2hlcmUgdGhl
IGlzc3VlIGlzIGFuZCBpZiBJIHVuZGVyc3Rvb2QgdGhlIHByb2JsZW0uCkkgbWlnaHQgdHJ5IHRv
IHJ1biBRRU1VIG9uIHBvd2VycGMgd2l0aCBLVW5pdHMgdG8gc2VlIGlmIEkgc2VlIGFueSBsb2dz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
