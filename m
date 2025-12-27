Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA8BE8FDD5
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oez8zxNbEbnHMPhpnbOAWnla0f9HiOILtwncTiJp0N4=; b=DfHoHtfSfldqkI
	Hu75HKBHD/QguIO5aRXruzQBp/bwYb9e7s+OSwPcksK0rCbu00OwawFd/eQyUfTyRJPZCnNRh7Y2g
	APDNYqTyOFPvJZtPDhyO6JIU5A20qFSBAuEpILNqiafFzNDYafCsshK0bXIYRLD3/F0MpaHPs0JUQ
	+PuakWaz6nFZ59U7iVJvuDz4RAiD3eM3WxgprjR0spNH01kuZrPY/eByUhYAhG8j+XGddV0Vh6onE
	YRy+OOr1HweDd8WL1CmmWUkbR9SV55P9xMzBkvIgOWQNlYFm8OtMfPj4me3fIAca2mxmzsH+P96rh
	wLLqEPVfgJX3grFW7yPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSAy-00000001sda-2xa8;
	Sat, 27 Dec 2025 11:09:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSAv-00000001sd4-3E18
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 11:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2192441986;
	Sat, 27 Dec 2025 11:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E0C4CEF1;
	Sat, 27 Dec 2025 11:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766833773;
	bh=JbOZLdmbqKiIXGK3unBmKB2Pa3tI/97z6pwAtInxolY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7TIhrpI/J7VeLmIj6OuxDyfWwcsMU+tMtYqEfIU2d2WtnJ3uYsB9H+Ugl20FqGe8
	 AyfZxubngGH/GhcPbT+momXUlfYPO+lbfmPJ4WOjJp0FxKngGWdiZNQ4TZAcybyzEM
	 L87cI3C6mX6nAL0J63zka6I1ONBKTqsovMufIHXmnp5t225uXgtyAkpl0tWf6/n1gd
	 qzxJcDJNTnQKhUzCtOdjGubLGwXg//yuO3ASOiyoEFl4NBta6fkoJOTiq9sudsU7Ce
	 qjp5/3G8AwY8vd2VK/q4FEhCvNg4Vn1p3jfEAjEVaWEYFiDW/MuAGTaodaLP98TDNA
	 SY7hDI8G1vvww==
Date: Sat, 27 Dec 2025 12:09:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Han Gao (Revy)" <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <20251227-gigantic-handsome-falcon-3c31bf@quoll>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_030933_828625_7EA4818C 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 25, 2025 at 05:45:00PM +0800, Han Gao (Revy) wrote:
> > +            dpu_out_dp1: endpoint@1 {
> > +              reg = <1>;
> > +              remote-endpoint = <&hdmi_in>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.52.0
> > 
> 
> Tested-by: Han Gao <gaohan@iscas.ac.cn>

NAK, not true. Otherwise explain me how can you test the bindings.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
