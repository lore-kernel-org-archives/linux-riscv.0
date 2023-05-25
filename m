Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438CC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHoomPl6ze4UyPHXYtUuscCl26Ld+zkDtFztsq3KjJQ=; b=IYS8ngw4L7SxAh
	/sMlMDng5rhl4Ty9lnkHrc1ldLGW51USH4N6kKBnHnWuPijYUpK05yNaqdtPiAF1dVQVKDl7ThI/+
	ZLDFjgyyllZL3ClH3Ttt4QihnmfrJAV/L27SV+D35T7j2UDBXytIYpyfZXqbHz8+GGGk7z37lbJja
	5KFu3DCpup9s4Y4hCPY0+YE8udEDjB+YbLXCeUpellhjOevi7razCiod2Ehvvzl5aoU6ppAYuWv0+
	E5SKy4COfM1Y/Z2jVLk2/IP6/PCvcVnZD57zilRkZj4JiC62QFiuBxGp/b3ZGcrn8B65or1QJzDO4
	nBHckW1vmKb7o0LambXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BFZ-00GlBq-3B;
	Thu, 25 May 2023 13:43:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BFW-00GlB9-38
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 13:43:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51440706e59so1105166a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 06:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1685022204; x=1687614204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOccQXmo2035CwTFujmC8mOqSuEwBb9LtX0oVjEbuJY=;
        b=OkMUYmydKGw5MAtGrmnKLknwVM75BiYt9vXJFl4d/v5aKqnpw6s3mNfu7ess3qJSGC
         c2bKWnfDgNr5FMrKg+vu0jVS+n7L3NjEfUx0ue8njRxP8alsciAXDQAkG/exd7FF1518
         bK+KgQs8QtbQ6mmdp2t6r1rE+FWMtj1uYIDnScU2XgNFW43moZ70VxdX+SCD3PE7nnVm
         J2F/9VRwXstHKK2rstRz+rr5DIdQ3A8OW7Uiy0DJftQhaluXAO6zOxWH11RoedQYGBgS
         FXatctF8adb7RyiB7Vu+EvIE+lpMZmZnbdRwtvvkohUsq7dYnciWCwyT9XbzWWAQwbRE
         BggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685022204; x=1687614204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOccQXmo2035CwTFujmC8mOqSuEwBb9LtX0oVjEbuJY=;
        b=TkEevpSsyLF7agh8qCyF4JFnY4K52So6Ht6LinlhoSC0jH56POPCeDdET8zvKDNPwh
         CZuqMxtFjs6l0/2tIs8QBkMoybD74Lcj3tSr44SeZlHC/BGThTu3nLGUSi+lAQPDfbeg
         O7pGnb+Br4zZfpr9gLAeUNewvBxdxZ6oSs8irXulGZvv4ZAZlizSK5kMi2N6fxytWrjU
         RKlzwBPfm79Q/B40Z2LN/PiRimiQ9Y48ir7r35MZO06hQ9tduZKZRVCoxJZHNBPOrnO1
         10jUG6m9wkowdXArF1C5iXaDpGdkxfB+h3eIf0/99A6WhyQBIIcbyiSWK/phTD8+0xl+
         Up3A==
X-Gm-Message-State: AC+VfDw0GJZ3mHwN3c0Y8HzBf6wNZTz/wkpxYaaafC4v+PsQr966rJHh
	k4RvenRaS39RDBDnxvWFJ29dZsmo0zOm1kqLaqTQAg==
X-Google-Smtp-Source: ACHHUZ6wsi7g3mzKLT7/HrWAvj9ILnXRy+0i9nwts74wzsSjaf9/EQm8jI3GTRil4xAQ0ViuEiXsGmxbWJd9lTb/GhQ=
X-Received: by 2002:a17:907:944e:b0:973:92d4:9f4e with SMTP id
 dl14-20020a170907944e00b0097392d49f4emr1353242ejc.53.1685022204015; Thu, 25
 May 2023 06:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy> <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr> <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy> <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
In-Reply-To: <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 25 May 2023 19:13:11 +0530
Message-ID: <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, 
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_064327_231621_5ACC53FD 
X-CRM114-Status: GOOD (  25.58  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgNzowOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDY6
NTE6MjhQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPgo+ID4gPiBXZSBzaG91bGQgb25seSBy
ZWx5IG9uIHRoaXMgbm9kZSBuYW1lIGZvciBrbm93biBiYWQgdmVyc2lvbnMgb2Ygb3BlbnNiaQo+
ID4gPiBJTU8uIEdvaW5nIGZvcndhcmQsIGlmIHNvbWV0aGluZyBuZWVkcyB0byBiZSByZXNlcnZl
ZCBmb3IgZmlybXdhcmUsIHRoZQo+ID4gPiBmaXJtd2FyZSBzaG91bGQgbWFrZSBzdXJlIHRoYXQg
aXQgaXMgcmVzZXJ2ZWQgYnkgdXNpbmcgdGhlIHByb3BlcnR5IGZvcgo+ID4gPiB0aGF0IHB1cnBv
c2UgOikKPgo+ID4gVGhlcmUgaXMgbm8gaXNzdWUgd2l0aCBPcGVuU0JJIHNpbmNlIGl0IGRvZXMg
dGhlIHJpZ2h0IHRoaW5nIGJ5IG1hcmtpbmcKPiA+IG1lbW9yeSBhcyByZXNlcnZlZCBpbiB0aGUg
RFQuIFRoaXMgcmVhbCBpc3N1ZSBpcyB3aXRoIHRoZSBrZXJuZWwgaGFuZGxpbmcKPiA+IG9mIHJl
c2VydmVkIG1lbW9yeSBmb3IgaGliZXJuYXRlLgo+Cj4gSSBkb24ndCB0aGluayB3ZSBhcmUgdGFs
a2luZyBhYm91dCB0aGUgc2FtZSB0aGluZyBoZXJlLiBJIG1lYW50IHRoZQo+IG5vLW1hcCBwcm9w
ZXJ0eSB3aGljaCBPcGVuU0JJIGRvZXMgbm90IHNldC4KClllcywgd2UgYXJlIHRhbGtpbmcgYWJv
dXQgdGhlIHNhbWUgdGhpbmcuIEl0J3Mgbm90IGp1c3QgT3BlblNCSSBub3QKc2V0dGluZyBuby1t
YXAgcHJvcGVydHkgaW4gcmVzZXJ2ZWQgbWVtb3J5IG5vZGUgYmVjYXVzZSBvdGhlcgpTQkkgaW1w
bGVtZW50YXRpb25zIHdvdWxkIGJlIGRvaW5nIHRoZSBzYW1lIHRoaW5nIChpLmUuIG5vdCBzZXR0
aW5nCm5vLW1hcCBwcm9wZXJ0eSkKClJlZ2FyZHMsCkFudXAKCj4KPiA+IExpa2UgQXRpc2ggbWVu
dGlvbmVkLCBub3QganVzdCBPcGVuU0JJLCB0aGVyZSB3aWxsIGJlIG90aGVyIGVudGl0aWVzCj4g
PiAobGlrZSBUU00pIG9yIHNvbWUgb3RoZXIgTS1tb2RlIGZpcm13YXJlIHdoaWNoIHdpbGwgYWxz
byByZXNlcnZlCj4gPiBtZW1vcnkgaW4gRFQvQUNQSSBzbyBjbGVhcmx5IGtlcm5lbCBuZWVkcyBh
IFNCSSBpbXBsZW1lbnRhdGlvbgo+ID4gaW5kZXBlbmRlbnQgd2F5IG9mIGhhbmRsaW5nIHJlc2Vy
dmVkIG1lbW9yeSBmb3IgaGliZXJuYXRlLgo+Cj4gPiA+ID4gQW5vdGhlciBvcHRpb24gaXMgdG8g
dXNlIGNvbXBhdGlibGUgc3RyaW5nIG9yIGxhYmVsIHByb3BlcnR5IHRvIGluZGljYXRlCj4gPiA+
ID4gdGhhdCB0aGlzIG1lbW9yeSByZWdpb24gaXMgbm90IHRvIGJlIHNhdmVkL3Jlc3RvcmVkIGR1
cmluZyBoaWJlcm5hdGlvbi4KPiA+ID4gPiBUaGlzIGNhbiBiZSBkb2N1bWVudGVkIGluIFJJU0Mt
ViBEVCBiaW5kaW5ncyBhcyB3ZWxsIGFzIHRoZSBib290aW5nIGd1aWRlCj4gPiA+ID4gZG9jIHRo
YXQgYWxleCB3YXMgdGFsa2luZyBhYm91dC4KPiA+ID4KPiA+ID4gU3VyZSwgYSBkdC1iaW5kaW5n
IGZvciBzYmkgcmVzZXJ2ZWQgcmVnaW9ucyBkb2Vzbid0IGltbWVkaWF0ZWx5IHNvdW5kCj4gPiA+
IGxpa2UgYW4gYXdmdWwgaWRlYS4uLiBCdXQgd2Ugc3RpbGwgaGF2ZSB0byB3b3JrIGFyb3VuZCB0
aGUgYm9ya2VkCj4gPiA+IGZpcm13YXJlIC0gYmUgdGhhdCBkaXNhYmxpbmcgaGliZXJuYXRpb24g
b3IgdXNpbmcgdGhlIG1tb2RlX3Jlc3Ygbm9kZQo+ID4gPiB3aGVuIHdlIGtub3cgdGhhdCB0aGUg
dmVyc2lvbiBvZiBPcGVuU0JJIGlzIG9uZSBvZiB0aG9zZSB3aXRoIHRoZQo+ID4gPiBwcm9ibGVt
Lgo+Cj4gRGlkIHlvdSBza2lwIG92ZXIgdGhpcz8gSSB3YXMgYWdyZWVpbmcgdGhhdCBkZWZpbmlu
ZyBhIGNvbW1vbiBiaW5kaW5nIGZvcgo+IHNiaSByZXNlcnZlZCByZWdpb25zIHdhcyBhIGdvb2Qg
aWRlYS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
